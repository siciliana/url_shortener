require 'uri'

class Link < ActiveRecord::Base
  validates :original_link, presence: true
  valdiates :original_link, format: { with: /\https?:\/\//, message: "does not begin with http://or https://"}
  validates_format_of :uri, :with => URI.regexp



  # Remember to create a migration!

# Any non-empty string
# Any non-empty string that starts with "http://" or "https://"
# Any string that the Ruby URI module says is valid
# Any URL-looking thing which responds to a HTTP request, i.e., we actually check to see if the URL is accessible via HTTP
end
