# See how all your routes lay out with "rake routes"
Bluebird::Application.routes.draw do 

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru' 
    get 'users/sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  match '/profile', :controller => :profile, :action => :profile, :as => :profile  
  match '/video(/:action)', :controller => :video, :action => :new, :as => 'videos'
  match '/video/details(/:action)', :controller => :video, :action => :details, :as => 'details' 
  match '/video/trailer(/:action)', :controller => :video, :action => :trailer, :as => 'trailer'

  get "root/homepage" 

  match '/home(/:action)', :controller => :home, :action => :index, :as => :home 
  match '/home/theme(/:action)', :controller => :home, :action => :theme, :as => 'theme'
  match '/home/connect(/:action)', :controller => :home, :action => :connect, :as => 'connect'
 
  match '/technology(/:action)', :controller => :headlines, :action => :technology, :as => 'technology'
  match '/business(/:action)', :controller => :headlines, :action => :business, :as => 'business'
  match '/music(/:action)', :controller => :headlines, :action => :music, :as => 'music'
  match '/local(/:action)', :controller => :headlines, :action => :local, :as => 'local'
  match '/international(/:action)', :controller => :headlines, :action => :international, :as => 'international'
  match '/trending(/:action)', :controller => :headlines, :action => :trending, :as => 'trending'


  match '/payments(/:action)', :controller => :payments, :action => :index, :as => :payments
  match '/payments/billing(/:action)', :controller => :payments, :action => :billing, :as => 'billing'

  match '/settings(/:action)', :controller => :settings, :action => :index, :as => :settings
  match '/setting/user(/:action)', :controller => :settings, :action => :user_settings, :as => 'user_settings'
  
  match '/static(/:action(.:format))', :controller => 'static', :as => :static
 

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'root#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
