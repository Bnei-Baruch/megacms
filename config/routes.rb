require 'uri'
class CheckDomain
  def self.matches?(request)
    site = Site.find_by_domain(URI.parse(request.url).host)
    site && site.default_page
  end
end

Megacms::Application.routes.draw do
  
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  constraints(CheckDomain) do
    match "/" => redirect { |params, req|
      site = Site.find_by_domain(URI.parse(req.url).host) rescue nil
      default_page = site.try(:default_page)
      if default_page
        "/pages/#{CGI::escape(default_page.permalink)}"
      end
    }
  end

  resources :pages
  namespace :frontend_admin do
    resources :admin_bar
    resources :widgets do
      post :sort, :on => :collection
    end
    resources :pages do
      get :get_children, :on => :member
      get :node_change, :on => :collection
      get :set_homepage_status, :on => :collection
      get :set_navigation_status, :on => :collection
      get :set_published_status, :on => :collection
    end
  end
  root :to => "pages#show"


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
  # just remember to delete public/index_old.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
