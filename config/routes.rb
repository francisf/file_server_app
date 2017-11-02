Rails.application.routes.draw do
  resources :blobs
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
  get "blobs/get/:id" =>  "blobs#get", :as => "download", via: :get
end
