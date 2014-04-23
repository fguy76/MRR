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
   @movie = Movie.new
    @movie_info = movie_info(params[:id])
    
    
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


  

end

