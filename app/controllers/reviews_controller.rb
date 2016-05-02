class ReviewsController < ApplicationController
	
	def new
		@users = Moviegoer.all
		#default rendering
	end
	
	def create
		id_movie = params[:movie_id]
		@movie = Movie.find(id_movie)
		id_user = params[:review][:moviegoer_id]
		puts(id_user)
		@user = Moviegoer.find(id_user)
		@review = @movie.reviews.create!(params[:review].permit(:potatoes, :comments, :moviegoer_id))
		flash[:notice] = "A review has from #{@user.name} been successfully added to #{@movie.title}."
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