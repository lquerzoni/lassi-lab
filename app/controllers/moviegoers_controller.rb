class MoviegoersController < ApplicationController
	def index
		@moviegoers = Moviegoer.all
	end
	
	def show
		id = params[:id]
		@user = Moviegoer.find(id)
	end
	
	def new
		#default rendering
	end
	
	def create
		@user = Moviegoer.create!(params[:user].permit(:name, :provider, :uid))
		flash[:notice] = "#{@user.name} was successfully created."
		redirect_to moviegoers_path
	end
	
	def edit
		id = params[:id]
		@user = Moviegoer.find(id)
	end
	
	def update
		id = params[:id]
		@user = Moviegoer.find(id)
		@user.update_attributes!(params[:user].permit(:name, :provider, :uid))
		flash[:notice] = "#{@user.name} was successfully updated."
		redirect_to moviegoers_path(@user)
	end
	
	def destroy
		id = params[:id]
		@user = Moviegoer.find(id)
		@user.destroy
		flash[:notice] = "#{@user.name} has been deleted."
		redirect_to moviegoers_path
	end
end