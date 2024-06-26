Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  get "/search", to:"searches#search"
  get 'tagsearches/search', to: 'tagsearches#search'
  devise_for :users
  
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
   resource :favorite, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index,:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
          #URLやから自由.  #コントローラー名#アクション名
  	  get "followers" => "relationships#followers", as: "followers"
  end
  
  resources :chats, only: [:show, :create, :destroy]
end 
