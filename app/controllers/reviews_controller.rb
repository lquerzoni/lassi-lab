class ReviewsController < ApplicationController
	before_action :authenticate_moviegoer!
	def new
	end
	
	def create
		id_movie = params[:movie_id]
		@movie = Movie.find(id_movie)
		@user = current_moviegoer
		@review = @movie.reviews.create!(params[:review].permit(:potatoes, :comments, :moviegoer))
		authorize! :create, @review, :message => "BEWARE: You are not authorized to create new reviews."
		@review.moviegoer_id = @user.id
		@review.save!
		flash[:notice] = "A review has from #{@user.email} been successfully added to #{@movie.title}."
		redirect_to movie_path(@movie)
	end

	def like
		id_movie = params[:movie_id]
		id_review = params[:id]
		review = Review.find(id_review)
		if review.likes.present?
			l = review.likes + 1
		else
			l = 1
		end
		review.update(likes: l)
		redirect_to movie_path(id_movie)
	end
	
		
	def destroy
		id = params[:id]
		id_movie = params[:movie_id]
		@movie = Movie.find(id_movie)
		authorize! :destroy, @review, :message => "BEWARE: You are not authorized to delete reviews."
		@review = Review.find(id)
		@review.destroy
		flash[:notice] = "Your review has been deleted."
		redirect_to movie_path(@movie)
	end
end