Rails.application.routes.draw do
  
  # devise
  devise_for :roles, skip: :all
  devise_scope :role do
    get 'login' => 'devise/sessions#new', as: :new_role_session
    post 'login' => 'devise/sessions#create', as: :role_session
    delete 'logout' => 'devise/sessions#destroy', as: :destroy_role_session
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/top', to: "top#index"
  root to: 'top#index'
  # get '/top_second', to: "static_page#index"
  
  # work
  resources :works, :only => [:new, :show, :create]
  get '/welcome', to: "works#welcome"
  get '/works_new_confirm', to: "works#confirm"

  # task
  # :create も実装
  resources :tasks, :only => [:show, :update]
  post '/tasks/:id/done' => 'tasks#done',   as: 'done'
  post '/tasks/:id/undone' => 'tasks#undone',   as: 'undone'
  post '/tasks/:id/pushdate' => 'tasks#pushdate', as: 'pushdate'
  post '/tasks/:id/' => 'tasks#update', as: 'update'

  # roles
  resources :roles, :only => [:show]
  post '/roles/:id' => 'roles#update', as: 'r_update'

  # checklist
  resources :checklists, :only => [:create, :update]
  post '/checklists/:id/' => 'checklists#update', as: 'c_update'

  # templates
  resources :templates, :only => [:show, :index]
  get '/templates_category', to: 'templates#category'

end
