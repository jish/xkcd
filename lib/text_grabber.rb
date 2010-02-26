require 'rubygems'
require 'mechanize'

class TextGrabber

  # TODO - We're already grabbing the image once with mechanize (for the src).
  # We should have a way to use that object again. We don't need to make two
  # HTTP requests to get two different attributes of the same element.
  #
  #   img['src']
  #   img['title']
  #
  def self.grab(key)
    agent = Mechanize.new
    page  = agent.get("http://xckd.com/#{key}")
    img   = page.at('#middleContent img')

    img['title']
  end

end
