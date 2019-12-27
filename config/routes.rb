Rails.application.routes.draw do
  root to: 'homes#index'
# ================ devise ================
  devise_for :users,
    controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# ================ ユーザー ================
  resources :users

# ================ 部屋の写真 ================
  resources :roomimages

# ================ モノの写真 ================
  resources :items

# ================ ブログ ================
resources :blogs

end