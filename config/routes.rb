Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/top', to: "top#index"
  get '/top_second', to: "static_page#index"
  resources :works, :only => [:new, :show, :index]
  resources :tasks, :only => [:show]

end
