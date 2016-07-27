Rails.application.routes.draw do
  resources :imports
  resources :tenders
  resources :nokogiri
   root 'nokogiri#index'
end
