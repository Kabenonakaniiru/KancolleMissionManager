class Admins::ClassificationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :target_classification, only: %i[edit update destroy]

  def index
    @classifications = easy_index_sort(params, Classification.all)
  end

  def create
    do_transaction('登録', admins_classifications_url, :new, :index, nil) do
      Classification.create!(classification_params)
    end
  end

  def update
    do_transaction('更新', edit_admins_classification_url, :edit, :edit, nil) do
      @classification.update!(classification_params)
    end
  end

  def destroy
    do_transaction('削除', admins_classifications_url, :edit, :index, @classification.name) { @classification.destroy! }
  end

  private
    # FIXME: 実装が進むと呼び出されるはずだが、呼び出しをしない場合は削除すること。
    def customized_manipulate_message(manipulate, target_name, result)
      manipulate_message('分類マスタ', manipulate, target_name, result)
    end

    def classification_params
      params.require(:classification).permit(
        :name
      )
    end

    # TODO: 後で修正
    # def target_mission_params
    #   params.permit(%i[n_1_1 n_1_2 n_1_3 n_1_4 n_1_5 n_1_6 n_2_1 n_2_2 n_2_3 n_2_4 n_2_5 n_3_1 n_3_2 n_3_3 n_3_4 n_3_5 n_4_1 n_4_2 n_4_3
    #                    n_4_4 n_4_5 n_5_1 n_5_2 n_5_3 n_5_4 n_5_5 n_6_1 n_6_2 n_6_3 n_6_4 n_6_5 n_7_1 n_7_2_1 n_7_2_2 n_7_3_1 n_7_3_2 n_7_4])
    # end

    def target_classification
      @classification = Classification.find(params[:id])
    end
end
