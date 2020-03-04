Rails.application.routes.draw do
  resources :cities, defaults: { format: :json } do
    member do
      post :update_temp
    end
  end
end
