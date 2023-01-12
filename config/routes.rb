Rails.application.routes.draw do
  root "messages#index"
  
  resource :messages, only: [:create, :index]
  post "/setname", to: "messages#setName"
  get "/clear", to: "messages#clearChat"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
