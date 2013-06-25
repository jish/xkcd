require 'tiny_http'
require 'nokogiri'

class PageGrabber

  PAGES = {}

  def self.grab(key)
    PAGES[key] ||= Nokogiri::XML.parse(fetch_page(key))
  end

  def self.fetch_page(key)
    url = "https://xkcd.com/"

    if key
      url << "#{key}/"
    end

    body = agent.get(url).body
  end

  def self.agent
    TinyHttp.new
  end

end
