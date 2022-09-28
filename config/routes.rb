Rails.application.routes.draw do
  root "links#index"

  resources :screenshots
  resources :links

  post "selenium_monitor", to: "selenium_monitor#create", as: "init_monitor"
end
