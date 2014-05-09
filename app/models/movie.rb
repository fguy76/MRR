class Movie < ActiveRecord::Base
  attr_accessible :description, :title

  validates :title, uniqueness: { case_sensitive: false }

letsrate_rateable "speed", "price"
# syntax for 'themoviedb' gem -



################
# syntax for 'BadFruit' gem -



#if need to search for each movie individually by id so can get director details which arent returned otherwise -

# require 'badfruit'

# def self.look(look)
#   bf = BadFruit.new("r4e3javd3s39xq6963p3hbt7")
#   rt_movies = bf.movies.search_by_name("%#{look}%", page_limit=49)
#   rt_movies.each do |movie|
#     movie_id = movie.id
#     rt_movie = bf.movies.search_by_id("#{movie_id}")
#     Movie.create(title: rt_movie.name, description: rt_movie.directors)
#   end
#   movie = Movie.find(:all, :conditions => ['title LIKE ?', "%#{look}%"])
# end


#if dont want to search for each movie individually by id so its faster but can't get director details which arent returned otherwise -

# def self.look(look)
#   bf = BadFruit.new("r4e3javd3s39xq6963p3hbt7")
#   rt_movies = bf.movies.search_by_name("%#{look}%", page_limit=49)
#   rt_movies.each do |m|
#     Movie.create(title: m.name, description: m.synopsis)
#   end
#   movie = Movie.find(:all, :conditions => ['title LIKE ?', "%#{look}%"])
# end

# def self.look(look)
#   bf = BadFruit.new("r4e3javd3s39xq6963p3hbt7")
#     if look
#       movie = bf.movies.search_by_name("%#{look}%", page_limit=49)       
#     else
#       movie = bf.lists.in_theaters
#     end
# end






#####################


# syntax for 'rotten' gem --

# require 'rotten'

# Rotten.api_key = "r4e3javd3s39xq6963p3hbt7"

# def self.look(search)
#     if search
#        movie = Rotten::Movie.search("%#{search}%").to_a
#     else
#        movie = Rotten::Movie.in_theatres.to_a[0..9]
#     end
# end

#####################

# syntax for 'rottentomatoes' gem --

# require 'rottentomatoes'
# include RottenTomatoes
# Rotten.api_key = "r4e3javd3s39xq6963p3hbt7"
# def self.look(search)
#     if search
#        movie = RottenMovie.find(:title => "#{search}")
#     else
#        movie = RottenList.find(:type => "box_office")
#      end
#    end

#####################


  # # syntax for 'imdb_party' gem --

  # def self.look(search)
  #   if search
  #     movie = ImdbParty::Imdb.new(:anonymize => true)
  #     movie.find_by_title("%#{search}%")    
  #   else
  #     movie = ImdbParty::Imdb.new(:anonymize => true)
  #     movie.popular_shows
  #   end
  # end

end
