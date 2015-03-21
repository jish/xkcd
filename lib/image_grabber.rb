require 'page_grabber'

class ImageGrabber

  def self.grab(key)
    page = PageGrabber.grab(key)
    img = extract_image(page)

    img['src'].sub(/^https?:/, "")
  end

  def self.extract_image(page)
    (page.css('#middleContent img') + page.css('#comic img')).first
  end

end
