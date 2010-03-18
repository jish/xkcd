require 'rubygems'
require 'mechanize'

class PageGrabber

  PAGES = {}

  def self.grab(key)
    PAGES[key] ||= agent.get("http://xkcd.com/#{key}")
  end

  def self.agent
    @agent ||= Mechanize.new
  end

end
