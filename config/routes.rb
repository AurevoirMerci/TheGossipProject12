Rails.application.routes.draw do

  root 'index#show'
  
  get 'static_pages/team'
  get 'static_pages/contact'
  get 'static_pages/home'



  resources :login
  resources :gossip
  resources :city
  resources :user
  

  resources :gossip do
  resources :comment
  end
  
end
