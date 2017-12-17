Rails.application.routes.draw do
  get 'product/index'

  root to: "product#index"

  resources :product do
    collection {post :import}
    collection {delete :destroyall}
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
