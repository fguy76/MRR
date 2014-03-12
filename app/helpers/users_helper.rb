module UsersHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    default_url = "#{root_url}Chew2.jpg"  #have to correct this or set it to another default when deploying
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
