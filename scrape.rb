require 'nokogiri'
require 'open-uri'  
  
    # movie = "dark knight"
    #escaped_movie_name = CGI.escape(movie)
    url = "http://en.wikipedia.org/w/index.php?title=Special%3ASearch&profile=default&search=dark+knight_(film)&fulltext=Search"
    doc = Nokogiri::HTML(open(url))
    puts doc.at_css(".tbody").content