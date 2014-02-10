ChatRoom::Application.routes.draw do
  root 'welcome#index'

  resources :rooms, only: [:show] do
    post :connection, on: :collection
    post '', to: 'rooms#message', on: :member, as: :message
  end
end
