require 'net/http'

class KeyGrabber

  CACHE_TTL = 2 * 60 * 60

  def self.current_key
    if fresh? && @current_key
      return @current_key
    end

    body = fetch_homepage(Time.now)

    @current_key = extract_key(body)
  end

  def self.fresh?
    Time.now < expire_at
  end

  def self.expire_at
    last_read + CACHE_TTL
  end

  def self.last_read
    @last_read || Time.at(0)
  end

  def self.fetch_homepage(timestamp)
    uri = URI.parse("https://xkcd.com/")
    response = Net::HTTP.get(uri)
    @last_read = timestamp

    response
  end

  def self.extract_key(body)
    pattern = /Permanent link to this comic: https:\/\/xkcd.com\/(\d+)\//
    body.match(pattern)[1]
  end

  def self.reset!
    @current_key = nil
    @last_read = nil
  end

end
