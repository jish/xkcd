require 'rubygems'
require 'mechanize'

class PageGrabber

  PAGES = {}

  class << self
    attr_accessor :agent_queries
  end

  @agent_queries = 0

  def self.grab(key)
    PAGES[key] ||= agent.get("http://xkcd.com/#{key}")
  end

  def self.agent
    @agent_queries += 1
    @agent ||= Mechanize.new
  end

end
