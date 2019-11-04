Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "pages#home", as: "root"
  get "/unicorns", to: "unicorns#index", as: "unicorns"
  # post "/unicorns", to: "unicorns#create"
  # get "/unicorns/new", to: "unicorns#new", as: "new_unicorn"
  get "/unicorns/:id", to: "unicorns#show", as: "unicorn"

  get "/mycollection", to: "unicorns#collection", as: "collection"

  get "/payments/new", to: "payments#new", as: "new_payment"
  post "/payments", to: "payments#confirm", as: "payments"
  get "/payments/success", to: "payments#success", as: "success_payment"
  post "/payments/webhook", to: "payments#webhook", as: "webhook_payment"

  post "/listings/new", to: "listings#new", as: "new_listing"
  

end
