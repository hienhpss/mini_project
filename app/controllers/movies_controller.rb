class MoviesController < ApplicationController

	before_action :set_event, :only => [ :show, :edit, :update, :destroy]
	def index
 		@movies = Movie.all
 		#@movies = Movie.page(params[:page]).per(5)
 	end

 	def new
 		@movie = Movie.new
 	end

 	def create
 		@movie = Movie.new(movie_params)
 		if @movie.save
 		redirect_to movies_url
 		flash[:notice] = "Movie was successfully created"
 		else
 		render :action => :new
 		flash[:notice] = "Please check your input"
 		end
	end

	def show

 	end

 	def edit

 	end
 	def update
 		if @movie.update(movie_params)
 		redirect_to movie_url(@movie)
 		flash[:notice] = "Movie was successfully update"
 		else
 		render :action => :edit
 		flash[:notice] = "Please check your input"
 		end
 	end
 	def destroy
 		@movie.destroy
 		redirect_to :action => :index
 		flash[:alert] = "Movie was successfully deleted"
 	end

	private

 		def movie_params
 			params.require(:movie).permit(:title, :description)
 		end

 		def set_event
 			@movie = Movie.find(params[:id])
 		end
end
