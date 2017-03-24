Rails.application.routes.draw do
  
  root "rooms#home"

  get 'rooms/new'

  get 'users/history'

  get 'users/yourRooms'

  get 'users/offers'

  get 'users/edit'

  get 'users/new'

  get 'users/home' => "users#home"

  delete 'sign_out' => 'sessions#destroy'

  get "rooms/request_room"
  
  get 'pictures/destroy'
  get 'users/answer_request'

  resources :sessions
  resources :rooms, only: [:index, :show] do
    resources :comments, only: [:create,:destroy]
  end

  resources :users do
    post :answer_request, on: :member

    resources :rooms do
      post :request_room, on: :member
      resources :pictures, only: [:create,:destroy]
    end
  end
end
