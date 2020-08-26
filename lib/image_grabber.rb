require 'page_grabber'

##
# ImageGrabber retrieves image URLs from pages
#
class ImageGrabber

  ##
  # Given a key, looks up the corresponding page, and extracts the image
  #
  def self.grab(key)
    page = PageGrabber.grab(key)
    img = extract_image(page)

    img['src'].sub(%r{^http://imgs.xkcd.com}, '//imgs.xkcd.com')
  end

  def self.extract_image(page)
    (page.css('#middleContent img') + page.css('#comic img')).first
  end
end
