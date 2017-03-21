Rails.application.routes.draw do
  get 'rooms/show'

  get 'rooms/edit'

  get 'rooms/new'

  get 'rooms/index'

  get 'rooms/home'

  get 'users/history'

  get 'users/yourRooms'

  get 'users/offers'

  get 'users/show'

  get 'users/edit'

  get 'users/new'

  resources :users do
    resources :rooms
  end

  root "rooms#home"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
