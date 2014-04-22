# syntax for 'themoviedb' gem using openstruct-
require 'ostruct'
  def movie_details(id)
  Tmdb::Api.key("96d9326a2109f91c149bfc80a0cd7b3f")
  @movie_credits = Tmdb::Movie.credits("#{id}")
  
  @movie_cast =  @movie_credits["cast"]   
  @movie_director = @movie_credits["crew"].find { |h| h["job"] == "Director" }["name"] 
   OpenStruct.new(director: @movie_director, cast: @movie_cast)
end

gi = movie_details(155)
gi.director
gi.cast 

######################
# syntax for 'themoviedb' gem using arrays -

def movie_details(id)
  Tmdb::Api.key("96d9326a2109f91c149bfc80a0cd7b3f")
  @movie_credits = Tmdb::Movie.credits("#{id}")
  
  @movie_cast =  @movie_credits["cast"]   
  @movie_director = @movie_credits["crew"].find { |h| h["job"] == "Director" }["name"] 
  [ director: @movie_director, cast: @movie_cast ]
end

gi.map { |h| h.values_at(:director) } 
gi.map { |h| h.values_at(:cast) }


#######################

