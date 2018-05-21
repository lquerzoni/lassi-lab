class MoviesController < ApplicationController
	before_action :authenticate_moviegoer!
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
		authorize! :create, @movie, :message => "BEWARE: You are not authorized to create new movies."
		flash[:notice] = "#{@movie.title} was successfully created."
		redirect_to movies_path
	end
	
	def edit
		id = params[:id]
		@movie = Movie.find(id)
		authorize! :update, @movie
	end
	
	def update
		id = params[:id]
		@movie = Movie.find(id)
		authorize! :update, @movie, :message => "BEWARE: You are not authorized to update a movies."
		@movie.update_attributes!(params[:movie].permit(:title, :rating, :description, :release_date))
		flash[:notice] = "#{@movie.title} was successfully updated."
		redirect_to movie_path(@movie)
	end
	
	def destroy
		id = params[:id]
		@movie = Movie.find(id)
		authorize! :destroy, @movie, :message => "BEWARE: You are not authorized to delete movies."
		@movie.destroy
		flash[:notice] = "#{@movie.title} has been deleted."
		redirect_to movies_path
	end
end