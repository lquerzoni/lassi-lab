class ReviewsController < ApplicationController
	before_action :authenticate_moviegoer!
	def new
	end
	
	def create
		id_movie = params[:movie_id]
		@movie = Movie.find(id_movie)
		@user = current_moviegoer
		@review = @movie.reviews.create!(params[:review].permit(:potatoes, :comments, :moviegoer))
		@review.moviegoer_id = @user.id
		@review.save!
		flash[:notice] = "A review has from #{@user.email} been successfully added to #{@movie.title}."
		redirect_to movie_path(@movie)
	end
		
	def destroy
		id = params[:id]
		@movie = Movie.find(id)
		@movie.destroy
		flash[:notice] = "#{@movie.title} has been deleted."
		redirect_to movies_path
	end
end