require 'rubygems'
require 'mechanize'

require 'lib/page_grabber'

class TextGrabber

  def self.grab(key)
    page = PageGrabber.grab(key)
    img  = page.at('#middleContent img')

    img['title']
  end

end
