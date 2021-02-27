Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  # get 'categories/:category_id/filter', to: 'task#filter', as: 'category_tasks_filter'
  resources :categories do
    get 'filter'
    resources :tasks do
    end
  end
end
