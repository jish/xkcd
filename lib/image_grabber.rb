require 'rubygems'
require 'mechanize'

class ImageGrabber

  IMAGE_MAP = {}

  def self.grab(key)
    key = key.to_s

    get_image_location(key) unless IMAGE_MAP[key]

    IMAGE_MAP[key]
  end

  def self.get_image_location(key)
    agent = Mechanize.new
    page  = agent.get("http://xkcd.com/#{key}")
    img   = page.at('#middleContent img')

    IMAGE_MAP[key] = img['src']
  end

end
