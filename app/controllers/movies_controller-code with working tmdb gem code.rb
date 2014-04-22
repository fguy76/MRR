class MoviesController < ApplicationController

  include MoviesHelper
  # GET /movies
  # GET /movies.json

  def index
    # If the look param with its whitespace stripped off
    # actually has something left then search for it
    unless params[:look].nil? || params[:look].strip.empty?
    @movies = look(params[:look])
  end

    # @movie_search = Movie.find(params[:q])
    # @movies  = @movie_search.result.paginate(page: params[:page])    

    
  end

  # GET /movies/1
  # GET /movies/1.json


  def show
    
   @movie = Movie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/new
  # GET /movies/new.json
  def new
    @movie = look_by_id(params[:id])

    @movie_director = movie_director(params[:id])
    @movie_cast = movie_cast(params[:id])

    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end


  def look(look)
  Tmdb::Api.key("96d9326a2109f91c149bfc80a0cd7b3f")
  tmdb_movies_search = Tmdb::Search.new
  tmdb_movies_search.resource('movie') # determines type of resource
  tmdb_movies_search.query("#{look}") # the query to search against
  tmdb_movies_search.fetch
end

def look_by_id(id)
  Tmdb::Api.key("96d9326a2109f91c149bfc80a0cd7b3f")
  @movie = Tmdb::Movie.detail("#{id}")  
end

def movie_details(id)
  Tmdb::Api.key("96d9326a2109f91c149bfc80a0cd7b3f")
  @movie_credits = Tmdb::Movie.credits("#{id}")
end

def movie_director(id)
  Tmdb::Api.key("96d9326a2109f91c149bfc80a0cd7b3f")
  @movie_credits = Tmdb::Movie.credits("#{id}")
  @movie_director = if h = @movie_credits["crew"].find { |h| h["job"] == "Director" }
      p h["name"]
    else
  puts 'Not found!'
end
end

def movie_cast(id)
  Tmdb::Api.key("96d9326a2109f91c149bfc80a0cd7b3f")
  @movie_credits = Tmdb::Movie.credits("#{id}")
  @movie_cast = @movie_credits["cast"]
end
end
