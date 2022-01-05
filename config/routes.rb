Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :admins do
    resources :missions do
      get 'find_mission_area'
      post 'mission_area_save'
    end
    # TODO: ひとまず生成。後で精査。
    resources :classifications
  end

  get '*path', controller: 'application', action: 'render_404'
end
