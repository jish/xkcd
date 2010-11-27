require 'mechanize'
require 'page_grabber'

class ImageGrabber

  def self.grab(key)
    page = PageGrabber.grab(key)
    img  = page.at('#middleContent img')

    img['src']
  end

end
