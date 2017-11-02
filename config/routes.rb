Rails.application.routes.draw do
  resources :blobs
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blobs#index'
  get "blobs/get/:id" =>  "blobs#get", :as => "download", via: :get
end
