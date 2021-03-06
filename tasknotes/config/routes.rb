Rails.application.routes.draw do
  devise_for :users
    get 'tasks/index'
    
    #/tasks/new(.:format)	tasks#new
    post "/tasks/new" => "tasks#new"
    
    #GET	/tasks/:id/edit(.:format)	tasks#edit
    post "/tasks/:id/edit" => "tasks#edit"
    
    #/tasks/:id(.:format)                     tasks#show
    post "/tasks/:id" => "tasks#show"
    
    #/tasks/:task_id/notes/new(.:format)      notes#new
    post "/tasks/:task_id/notes/new" => "notes#new"
    
    
    #/tasks/:task_id/notes/:id(.:format)	notes#destroy
    #delete "/tasks/:task_id/notes/:id" => "notes#destroy"
    
    resources :tasks do
        resources :notes
    end
    
    root 'tasks#index'
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
