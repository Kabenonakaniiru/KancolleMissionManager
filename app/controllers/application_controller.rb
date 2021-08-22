class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500

  helper_method :logged_in?, :admin_logged_in?
  before_action :set_sentry_context # TODO: 認証後のコントローラは前のコントローラと分ける。このクラスはあくまでも基底クラスとして使う, :authenticate_user!

  # 頁が見つからなかった場合。
  def render_404
    render template: 'errors/error_404', status: :not_found, layout: 'application', content_type: 'text/html'
  end

  # 内部エラーが発生した場合。
  def render_500
    render template: 'errors/error_500', status: :internal_server_error, layout: 'application',
           content_type: 'text/html'
  end

  protected
    # 簡易にindex頁のsortを行う。(デフォルトでid昇順指定)
    def easy_index_sort(received_params, search_query)
      @q = search_query.ransack(received_params[:q])
      @q.sorts = 'id asc' if @q.sorts.empty?
      @q.result
    end

    def manipulate_message(target, manipulate, target_name, result)
      p target_name
      "#{target}#{target_name.nil? ? '' : '[' + target_name + ']'}の#{manipulate}に#{result ? '成功' : '失敗'}しました。"
    end

  private
    def logged_in?
      # see https://techracho.bpsinc.jp/hachi8833/2016_11_15/28993
      # 戻り値をtrue/falseに統一する
      current_user.present?
    end

    def admin_logged_in?
      current_admin.present?
    end

    def set_sentry_context
      Sentry.set_user(id: session[:current_user_id]) # or anything else in session
      Sentry.set_extras(params: params.to_unsafe_h, url: request.url)
    end
end
