class Admins::MissionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :classifications
  before_action :target_mission, only: %i[edit update destroy]

  def index
    parent_sea_areas = Area.where(level: 1)
    # FIXME: 一旦定義。後でデータからカウントを取るように修正する。
    # 第一階層の定義を強引に作る
    parent_sea_area_counts = [6, 5, 5, 5, 5, 5, 6]
    @header_parent_areas = {}
    parent_sea_areas.each_with_index do |parent_sea_area, i|
      @header_parent_areas.store(parent_sea_area.name, parent_sea_area_counts[i])
    end
    # 編集カラム分、1加算している。
    @total_parent_sea_area_count = parent_sea_area_counts.inject(&:+) + 1
    @header_children_areas = ActiveRecord::Base.connection.select_all('SELECT id, level, parent_area_id, name, column_name FROM areas parent LEFT OUTER JOIN (SELECT id AS child_id, name AS child_name, parent_area_id AS child_parent_area_id FROM areas) child ON parent.id = child.child_parent_area_id WHERE parent.column_name IS NOT NULL;')
    @mission_count_areas = Area.where.not(column_name: nil)
    @missions = easy_index_sort(params, Mission.all.includes(:classification))
  end

  def create
    do_transaction('登録', admins_missions_url, :new, :index, nil) { Mission.create!(mission_params) }
  end

  def update
    do_transaction('更新', edit_admins_mission_url, :edit, :edit, nil) { @mission.update!(mission_params) }
  end

  def destroy
    do_transaction('削除', admins_missions_url, :edit, :index, @mission.name) { @mission.destroy! }
  end

  def find_mission_area
    mission = Mission.find(params[:mission_id].to_i)
    render json: mission
  end

  def mission_area_save
    # TODO: ここ、パラメータを"id"に出来れば、target_missionを使えるようになるはずなので、なんとかしたい。TODO: mission_idでエラーが出ている。
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
    def customized_manipulate_message(manipulate, target_name, result)
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
      params.permit(%i[n_1_1 n_1_2 n_1_3 n_1_4 n_1_5 n_1_6 n_2_1 n_2_2 n_2_3 n_2_4 n_2_5 n_3_1 n_3_2 n_3_3 n_3_4 n_3_5 n_4_1 n_4_2 n_4_3
                       n_4_4 n_4_5 n_5_1 n_5_2 n_5_3 n_5_4 n_5_5 n_6_1 n_6_2 n_6_3 n_6_4 n_6_5 n_7_1 n_7_2_1 n_7_2_2 n_7_3_1 n_7_3_2 n_7_4])
    end
end
