#
# Code Solo Routing
#
ActionController::Routing::Routes.draw do |map|

  # Root home controller
  map.root :controller => 'home', :action => 'index'

  map.resources :projects, :member => { :help => :post, :watch => :post },
                :requirements => {:id => /.*/}

  map.resources :pubs
  map.resources :tags

  map.resources :users,  :member => { :follow => :post, :unfollow => :post }
  # map.resources :groups, :member => { :join => :post,   :unjoin => :post }
  # map.resources :pubs,   :member => { :fetch => :post }

  map.resource :options, :only => [:show, :update]

  map.resource :user_session
  map.search   '/search/:search', :controller => 'home', :action => 'search', :defaults => { :search => '' }
  map.logout   '/logout',   :controller => 'user_sessions', :action => 'destroy'
  map.login    '/login',    :controller => 'user_sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup   '/signup',   :controller => 'users', :action => 'new'

  map.help    '/help',    :controller => 'help',    :action => 'index'
  map.about   '/about',   :controller => 'home',    :action => 'about'
  map.friends '/friends', :controller => 'home', :action => 'friends'
  map.friends '/send',    :controller => 'home', :action => 'sendmail'

  # Connect usernames
  map.connect ':login', :controller => 'home', :action => 'profile'

end
