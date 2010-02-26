require 'rubygems'
require 'mechanize'

class KeyGrabber

  def self.current_key
    agent = Mechanize.new
    page  = agent.get("http://xkcd.com")
    page.at("h3:nth-child(11)").text.delete('^0-9')
  end

end
