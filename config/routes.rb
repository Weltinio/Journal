Rails.application.routes.draw do
  get 'categories/', to: 'categories#index'
  get 'categories/new', to: 'categories#new', as: 'new_category'
  get 'categories/:title', to:  'categories#show', as: 'show_category'
  get 'categories/:title/edit', to: 'categories#edit', as: 'edit_category'
  delete 'categories/:title/delete', to: 'categories#delete', as: 'delete_category'
  put 'categories/:title/update', to: 'categories#update', as: 'update_category'
  post 'categories/create', to: 'categories#create', as: 'create_category'
end
