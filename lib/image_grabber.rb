require 'mechanize'
require 'page_grabber'

class ImageGrabber

  def self.grab(key)
    page = PageGrabber.grab(key)
    img = extract_image(page)

    img['src']
  end

  def self.extract_image(page)
    page.at('#middleContent img') || page.at('#comic img')
  end

end
