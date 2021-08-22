class Admins::MissionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :classifications
  before_action :target_mission, only: %i[edit update destroy]

  def index
    parent_sea_areas = Area.where(level: 1)
    # FIXME: 一旦定義。後でデータからカウントを取るように修正する。
    # 第一階層の定義を強引に作る
    parent_sea_area_counts = [6, 5, 5, 5, 5, 5, 5]
    @header_parent_areas = {}
    parent_sea_areas.each_with_index do |parent_sea_area, i|
      @header_parent_areas.store(parent_sea_area.name, parent_sea_area_counts[i])
    end
    # 編集カラム分、1加算している。
    @total_parent_sea_area_count = parent_sea_area_counts.inject(&:+) + 1
    @header_children_areas = ActiveRecord::Base.connection.select_all('SELECT id, level, parent_area_id, name, column_name FROM areas parent LEFT OUTER JOIN (SELECT id AS child_id, name AS child_name, parent_area_id AS child_parent_area_id FROM areas) child ON parent.id = child.child_parent_area_id WHERE parent.column_name IS NOT NULL;')
    @mission_count_areas = Area.where.not(column_name: nil)
    @missions = Mission.all.includes(:classification)
  end

  def create
    do_transaction('登録', admins_missions_url, :index, nil) { Mission.create!(mission_params) }
  end

  def update
    do_transaction('更新', edit_admins_mission_url, :edit, nil) { @mission.update!(mission_params) }
  end

  def destroy
    do_transaction('削除', admins_missions_url, :index, @mission.name) { @mission.destroy! }
  end

  def find_mission_area
    mission = Mission.find(params[:mission_id].to_i)
    render json: mission
  end

  def mission_area_save
    # TODO: ここ、パラメータを"id"に出来れば、target_missionを使えるようになるはずなので、なんとかしたい。
    @mission = Mission.find(params[:mission_id])
    ActiveRecord::Base.transaction do
      # TODO: ModelViewへの切り出し。
      # TODO: Validationの実装
      # TODO: 保存ロジックのModelへの移動。
      @mission.update!(target_mission_params)
    end
    render json: Mission.find(params[:mission_id])
  end

  private
    def mission_manipulate_message(manipulate, target_name, result)
      manipulate_message('任務マスタ', manipulate, target_name, result)
    end

    def classifications
      @classifications = Classification.all
    end

    def target_mission
      @mission = Mission.find(params[:id])
    end

    def mission_params
      params.require(:mission).permit(
        :name,
        :classification_id,
        :limited,
        :url,
        :note
      )
    end

    def target_mission_params
      params.permit(%i[n1_1 n1_2 n1_3 n1_4 n1_5 n1_6 n2_1 n2_2 n2_3 n2_4 n2_5 n3_1 n3_2 n3_3 n3_4 n3_5 n4_1 n4_2 n4_3
                       n4_4 n4_5 n5_1 n5_2 n5_3 n5_4 n5_5 n6_1 n6_2 n6_3 n6_4 n6_5 n7_1 n7_2_1 n7_2_2 n7_3_1 n7_3_2])
    end

    def do_transaction(manipulate, success_url, error_action, target_name, &block)
      ActiveRecord::Base.transaction(&block)
      redirect_to success_url, notice: mission_manipulate_message(manipulate, target_name, true)
    rescue ActiveRecord::RecordInvalid => e
      logger.error(e)
      begin
        pp 'before'
        e.record.errors.each { |error| pp error }
      rescue StandardError => e2
        logger.error(e2)
      end
      p 'after'
      flash[:alert] =
        "#{mission_manipulate_message(manipulate, target_name, false)} 詳細メッセージ:[#{e.message}]"
      redirect_to action: error_action
    rescue StandardError => e
      logger.error(e)
      flash[:alert] = "#{mission_manipulate_message(manipulate, target_name, false)} 詳細メッセージ:[#{e.message}]"
      redirect_to action: error_action
    end
end
