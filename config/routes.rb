Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "pages#home", as: "root"
  get "/unicorns", to: "unicorns#index", as: "unicorns"
  # post "/milkshakes", to: "milkshakes#create"
  # get "/milkshakes/new", to: "milkshakes#new", as: "new_milkshake"
  get "/unicorns/:id", to: "unicorns#show", as: "unicorn"
 
  # get "/payment/success", to: "payments#success", as: "success_payment"
  # post "/payment/webhook", to: "payments#webhook", as: "webhook_payment"

end
