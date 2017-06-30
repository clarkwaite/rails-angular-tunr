Rails.application.routes.draw do
  resources :artists do
    resources :songs
  end
  root "welcome#index"
end