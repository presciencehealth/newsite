Rails.application.routes.draw do

  get 'demo/new'

  scope :module => 'buttercms' do
    get '/categories/:slug' => 'categories#show', :as => :buttercms_category
    get '/author/:slug' => 'authors#show', :as => :buttercms_author

    get '/blog/rss' => 'feeds#rss', :format => 'rss', :as => :buttercms_blog_rss
    get '/blog/atom' => 'feeds#atom', :format => 'atom', :as => :buttercms_blog_atom
    get '/blog/sitemap.xml' => 'feeds#sitemap', :format => 'xml', :as => :buttercms_blog_sitemap

    get '/blog(/page/:page)' => 'posts#index', :defaults => {:page => 1}, :as => :buttercms_blog
    get '/blog/:slug' => 'posts#show', :as => :buttercms_post
  end

  get 'static_pages/home'
  
  get  '/pricing',   to: 'static_pages#pricing'
  
  get  '/about',   to: 'static_pages#about'

  get  '/demo',   to: 'demos#new'
  resources :demos, only: [:new, :create]
  
  get  '/video',   to: 'static_pages#video'
  
  get  '/staffright',   to: 'static_pages#staffright'
  
  get  '/agilecast',   to: 'static_pages#agilecast'
  
  get  '/privacy',   to: 'static_pages#privacy'
  
  get '/contact', to: 'contacts#new'
  resources :contacts, only: [:new, :create]
  
  get '/contact/success', to: 'contacts#success'
  
  get '/demo/success', to: 'demos#success'
  
  get  '/comingsoon',   to: 'static_pages#comingsoon'

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
