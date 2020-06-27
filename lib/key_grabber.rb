require 'net/http'

class KeyGrabber

  def self.current_key
    if fresh? && @current_key
      return @current_key
    end

    body = fetch_homepage(Time.now)

    @current_key = extract_key(body)
  end

  def self.fresh?
    five_minutes = 60 * 5
    expiration   = Time.now - five_minutes

    @last_read.to_i > expiration.to_i
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
