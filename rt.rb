# syntax for brookzhang-v1.09-edited xx.html.erb

Speed : <%= rating_for_user @movie, current_user, "speed", :star => 10 %>
 


<!-- for gosuto-v1.08-edited-->
Speed : <%= rating_for @movie, "speed", :star => 10, :userid => current_user.id %>


#####################

# syntax for 'BadFruit' gem --

bf = BadFruit.new("r4e3javd3s39xq6963p3hbt7")
movies = bf.movies.search_by_name("dark knight")
cast = movies[0].full_cast
first_actor = movies[0].cast[0]["name"]
first_actor_character = movies[0].cast[0]["characters"]
name_and_char = movies[0].map { |x| puts x["name"], x["characters"] }
def movie_save
bf = BadFruit.new("r4e3javd3s39xq6963p3hbt7")
movies = bf.movies.search_by_name("dark knight", page_limit=49)
movies.each do |m|
  Movie.create!(title: m.name, description: m.synopsis)
end
end

###
require 'badfruit'
  bf = BadFruit.new("r4e3javd3s39xq6963p3hbt7")
  rt_movies = bf.movies.search_by_name("dark knight", page_limit=49)
  rt_movies.each do |movie|
    movie_id = movie.id
    rt_movie = bf.movies.search_by_id("#{movie_id}")
  puts title: rt_movie.name
  puts description: rt_movie.directors
  end


#####################
# syntax for 'rotten' gem --

# require "rotten"
# Rotten.api_key = "r4e3javd3s39xq6963p3hbt7"
# search = "dark knight"
# movies = Rotten::Movie.search("#{search}").to_a
# mov = movies[0]
# puts mov.title
# movies.each { |movie| puts movie.title }


#####################
# 'rotten-tomatoes' gem uses screen scraping & seems to be broken

# syntax for 'rottentomatoes' gem --
# movie = RottenMovie.find(:title => "#{search}")
# movie = RottenList.find(:type => "box_office")