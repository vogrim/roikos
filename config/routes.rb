Rails.application.routes.draw do

  devise_for :users

  root to: redirect("/de", status: 302), as: :redirected_root

  get "/:locale", to: 'dashboard#index', as: 'root'

  get "/:locale/client_interactions/shift_scheduled_time", to: 'client_interactions#shift_scheduled_time'

  scope "/:locale", locale: /de|en/ do
    resources :products, :brands, :movements, :movement_types, :clients, :comments, :commissions
    resources :commission_items, :events, :bills, :client_interactions, :accounts, :users
    
    resource :current_user, path: "profile", only: [:show, :update]

    resources :client_projects do
      resources :client_project_items, path: "items"
    end

  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #  'welcome#index'

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
