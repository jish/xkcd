require 'page_grabber'
require 'image_grabber'

class TextGrabber

  def self.grab(key)
    page = PageGrabber.grab(key)
    extract_text(page)
  end

  def self.extract_text(page)
    img = ImageGrabber.extract_image(page)
    img['title']
  end

end
