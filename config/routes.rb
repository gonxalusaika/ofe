Rails.application.routes.draw do

  get 'preguntas/index'

  apipie
  # get 'recorridos' => 'recorridos#index'
  # get 'recorridos/new' => 'recorridos#new', as: 'new_recorrido'
  # get 'recorridos/:id' => 'recorridos#show', as: 'recorrido'
  # delete 'recorridos/:id' => 'recorridos#destroy'

  resources :preguntas

  resources :periodos

  resources :dinosaurios
  get "dinosaurios/:id_dinosaurio/preguntas" => "preguntas#index"

  resources :recorridos

  resources :users
  resources :sessions
  resources :cuestionarios

  root :to => 'browse#home'
  get "browse/profile"
  get "browse/message"
  get "browse/aboutus"

  get "admin" => "admin#index"
  get "resultados" => "resultados#index"
  get "recorridos/:recorrido/resultados" => "resultados#show", as: 'resultados_recorrido'

  #Sessions Users
  get "logout_user" => "sessions#destroy", :as => "logout_user"
  post "login_user" => "sessions#new", :as => "login_user"
  get "login" => "sessions#create", :as => "login"

 #Users
  get "signup" => "users#new", :as => "signup"

  namespace :api do
    get "dinosaurios" => "dinosaurios#index", :defaults => { :format => 'json' }
    get "periodos" => "periodos#index", :defaults => { :format => 'json' }
    get "cuestionarios" => "cuestionarios#index", :defaults => { :format => 'json' }
    get "cuestionarios/:id" => "cuestionarios#show", :defaults => { :format => 'json' }

    get 'recorridos' => "recorridos#index", defaults: {format: 'json'}
    get 'preguntas' => "preguntas#index", defaults: {format: 'json'}
    get 'recorridos/random' => "recorridos#random", defaults: {format: 'json'}
    get 'recorridos/:id' => "recorridos#show", defaults: {format: 'json'}
    post 'recorridos/create' => "recorridos#create", defaults: {format: 'json'}
    post 'recorridos/update' => "recorridos#update", defaults: {format: 'json'}
    post 'resultados/create' => "resultados#create", defaults: {format: 'json'}
    get 'resultados/recorrido/:recorrido_id' => "resultados#show", defaults: {format: 'json'}
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
