class Movie < ActiveRecord::Base
  attr_accessible :description, :title


  def self.look(search)
    if search
      movie = ImdbParty::Imdb.new(:anonymize => true)
      movie.find_by_title("%#{search}%")    
    else
      movie = ImdbParty::Imdb.new(:anonymize => true)
      movie.popular_shows
    end
  end

end
