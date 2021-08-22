class Admins::ClassificationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :target_classification, only: %i[edit update destroy]

  def index
    # TODO: この辺り、共通化できそうなので、後でやること。
    @q = Classification.all.ransack(params[:q])
    @q.sorts = 'id asc' if @q.sorts.empty?
    @classifications = @q.result
  end

  def create
    do_transaction('登録', admins_classifications_url, :index, nil) { Classification.create!(classification_params) }
  end

  def update
    do_transaction('更新', edit_admins_classification_url, :edit, nil) { @classification.update!(classification_params) }
  end

  def destroy
    do_transaction('削除', admins_classifications_url, :index, @classification.name) { @classification.destroy! }
  end

  private
    # FIXME: 実装が進むと呼び出されるはずだが、呼び出しをしない場合は削除すること。
    def classification_manipulate_message(manipulate, target_name, result)
      manipulate_message('分類マスタ', manipulate, target_name, result)
    end

    def classification_params
      params.require(:classification).permit(
        :name
      )
    end

    # TODO: 後で修正
    # def target_mission_params
    #   params.permit(%i[n1_1 n1_2 n1_3 n1_4 n1_5 n1_6 n2_1 n2_2 n2_3 n2_4 n2_5 n3_1 n3_2 n3_3 n3_4 n3_5 n4_1 n4_2 n4_3
    #                    n4_4 n4_5 n5_1 n5_2 n5_3 n5_4 n5_5 n6_1 n6_2 n6_3 n6_4 n6_5 n7_1 n7_2_1 n7_2_2 n7_3_1 n7_3_2])
    # end

    def target_classification
      @classification = Classification.find(params[:id])
    end
end
