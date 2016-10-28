Rails.application.routes.draw do
  devise_scope :user do
    get 'end_session' => 'omniauth_callbacks#signout'
    get 'login' => 'omniauth_callbacks#login'
  end


  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  get 'nursing_activities/inbox' => 'nursing_activities#inbox'
  get 'nursing_activities/send_mail' => 'nursing_activities#send_mail'
  get 'nursing_activities/saved' => 'nursing_activities#saved'
  get 'nursing_activities/notifications' => 'nursing_activities#notifications'

  namespace :api do
    resources :announcements, only: [:create]
  end

  namespace :admin do
    get 'index' => 'admin#index'
    get 'send_mail' => 'admin#send_mail'
    get 'statistics' => 'admin#statistics'
    get 'manage_data' => 'admin#manage_data'
    get 'notifications' => 'admin#notifications'
    get 'panel' => 'admin#panel'

    root 'admin#index'
  end


  resources :nursing_activities

  resources :announcements, only: [:show]

  resources :attachments, only: [:show]


  root 'nursing_activities#index'
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
