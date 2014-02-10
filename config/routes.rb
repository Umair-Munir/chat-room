ChatRoom::Application.routes.draw do
  root 'welcome#index'

  resources :rooms, only: [:show] do
    post :connection, on: :collection
  end
end
