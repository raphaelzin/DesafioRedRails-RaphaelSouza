Rails.application.routes.draw do
  
  root "rooms#home"

  get 'rooms/show'

  get 'rooms/edit'

  get 'rooms/new'

  get 'rooms/index'

  get 'rooms/home'

  get 'users/history'

  get 'users/yourRooms'

  get 'users/offers'

  get 'users/edit'

  get 'users/new'

  get 'users/home' => "users#home"

  delete 'sign_out' => 'sessions#destroy'

  get "rooms/request_room"

 resources :sessions
  
  resources :rooms

  resources :users do
    resources :rooms do
      post :request_room, on: :member
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
