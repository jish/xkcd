require 'page_grabber'

class TitleGrabber

  def self.grab(key)
    page = PageGrabber.grab(key)
  end

  def self.extract_title(page)
    title = page.at('h1') || page.at('#ctitle')
    title.text
  end

end
