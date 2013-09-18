require 'open-uri'

class Link < ActiveRecord::Base
  validates :original_link, presence: true
  validates_format_of :original_link, :with => URI.regexp
end
