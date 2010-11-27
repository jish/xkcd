require 'page_grabber'

class TitleGrabber

  def self.grab(key)
    page = PageGrabber.grab(key)

    page.at('h1').text
  end

end
