class Search < ActiveRecord::Base

attr_accessible :category, :keywords

def users
  @users ||= find_users
end

private

def find_users
  Users.find(:all, :conditions => conditions)
end

def keyword_conditions
  ["users.name LIKE ?", "%#{keywords}%"] unless keywords.blank?
end


def category_conditions
  ["products.category_id = ?", category_id] unless category_id.blank?
end

def conditions
  [conditions_clauses.join(' AND '), *conditions_options]
end

def conditions_clauses
  conditions_parts.map { |condition| condition.first }
end

def conditions_options
  conditions_parts.map { |condition| condition[1..-1] }.flatten
end

def conditions_parts
  private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
end


#   require 'google-search'
#   


# def find_item uri, query
#   search = Google::Search::Web.new do |search|
#     search.query = query
#     search.size = :large
#     search.each_response { print '.'; $stdout.flush }
#   end
#   search.find { |item| item.uri =~ uri }
# end

# def rank_for query
#   print "%35s " % query
#   if item = find_item(/vision\-media\.ca/, query)
#     puts " #%d" % (item.index + 1)
#   else
#     puts " Not found"
#   end
# end

end
