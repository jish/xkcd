require 'tiny_http'
require 'nokogiri'

class PageGrabber

  def self.grab(key)
    cache(key) { Nokogiri::XML.parse(fetch_page(key)) }
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

  def self.cache(key, &block)
    @page_cache ||= {}
    @page_cache[key] ||= block.call
  end

  def self.reset!
    @page_cache = {}
  end

end
