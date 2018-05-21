Rails.application.routes.draw do
  	devise_for :moviegoers, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	resources :movies do
		resources :reviews, only: [:new, :create, :destroy, :like]
	end

	get 'movies/:movie_id/like_review/:id', to: 'reviews#like', as: 'i_like_review'
	
	root :to  => redirect('/movies')
end
