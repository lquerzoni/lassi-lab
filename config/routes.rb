Rails.application.routes.draw do
	resources :movies
	resources :moviegoers
	
	root :to  => redirect('/movies')
end
