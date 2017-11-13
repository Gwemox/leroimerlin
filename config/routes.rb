Rails.application.routes.draw do
  devise_for :users
  mount ActionCable.server => '/cable'

  root 'home#index'
  resources :pictures
  post '/like', to: 'like#like', as: 'like_picture'
  get '/tags/:tag_id', to: 'home#index', as: 'picture_by_tag'
  get '/users', to: 'home#myPicture', as: 'my_picture'
  get '/users/:user_pseudo-:user_id', to: 'home#index', as: 'picture_by_user'
  get '/categories/:category_id', to: 'home#index', as: 'picture_by_cayegory'
  get '/search', to: 'home#index', as: 'search_picture'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
