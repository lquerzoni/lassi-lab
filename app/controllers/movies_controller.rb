class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end
	
	def show
		id = params[:id]
		@movie = Movie.find(id)
	end
	
	def new
		#default rendering
	end
	
	def create
		@movie = Movie.create!(params[:movie].permit(:title, :rating, :description, :release_date))
		flash[:notice] = "#{@movie.title} was successfully created."
		redirect_to movies_path
	end
	
	def edit
		id = params[:id]
		@movie = Movie.find(id)
	end
	
	def update
		id = params[:id]
		@movie = Movie.find(id)
		@movie.update_attributes!(params[:movie].permit(:title, :rating, :description, :release_date))
		flash[:notice] = "#{@movie.title} was successfully updated."
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