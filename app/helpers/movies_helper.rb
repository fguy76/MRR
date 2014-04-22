module MoviesHelper

def look(look)
  Tmdb::Api.key("96d9326a2109f91c149bfc80a0cd7b3f")
  tmdb_movies_search = Tmdb::Search.new
  tmdb_movies_search.resource('movie') # determines type of resource
  # tmdb_movies_search.filter({"page" => "2", "search_type" => "ngram"}) # code for tmdb gem option for next page of results (api search returns only 20 results per page)
  tmdb_movies_search.query("#{look}") # the query to search against
  tmdb_movies_search.fetch
end

def look_by_id(id)
  Tmdb::Api.key("96d9326a2109f91c149bfc80a0cd7b3f")
  @movie = Tmdb::Movie.detail("#{id}")  
end

require 'ostruct'
  def movie_info(id)
    Tmdb::Api.key("96d9326a2109f91c149bfc80a0cd7b3f")
    @movie_details = Tmdb::Movie.detail("#{id}")  
    @movie_credits = Tmdb::Movie.credits("#{id}")
    @movie_cast =  @movie_credits["cast"]   
    @movie_director = @movie_credits["crew"].find { |h| h["job"] == "Director" }["name"] 
    configuration = Tmdb::Configuration.new
    @poster_url = configuration.base_url+"w342"+@movie_details.poster_path
    OpenStruct.new(details: @movie_details, director: @movie_director, cast: @movie_cast, poster: @poster_url)

  end

  





end
