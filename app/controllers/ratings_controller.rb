class RatingsController < ApplicationController

before_filter :signed_in_user
  def create
            @movie = Movie.find_by_id(params[:movie_id])
            if current_user.id == @movie.id
                redirect_to movie_path(@movie), :alert => "You cannot rate for your own photo"
            else
                @rating = Rating.new(params[:rating])
                @rating.movie_id = @movie.id
                @rating.user_id = current_user.id
                if @rating.save
                    respond_to do |format|
                        format.html { redirect_to movie_path(@movie), :notice => "Your rating has been saved" }
                        format.js
                    end
                end
            end
        end

        def update
            @movie = Movie.find_by_id(params[:movie_id])
            if current_user.id == @movie.id
                redirect_to movie_path(@movie), :alert => "You cannot rate for your own photo"
            else
                @rating = current_user.ratings.find_by_movie_id(@movie.id)
                if @rating.update_attributes(params[:rating])
                    respond_to do |format|
                        format.html { redirect_to movie_path(@movie), :notice => "Your rating has been updated" }
                        format.js
                    end
                end
            end
        end

end
