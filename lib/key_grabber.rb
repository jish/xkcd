require 'net/http'

class KeyGrabber

  def self.current_key
    if fresh? && @current_key
      @current_key
    else
      @last_read = Time.now
      body = fetch_homepage

      extract_key(body)
    end
  end

  def self.fresh?
    five_minutes = 60 * 5
    expiration   = Time.now - five_minutes

    @last_read.to_i > expiration.to_i
  end

  def self.fetch_homepage
    uri = URI.parse("https://xkcd.com/")
    Net::HTTP.get(uri)
  end

  def self.extract_key(body)
    pattern = /Permanent link to this comic: https:\/\/xkcd.com\/(\d+)\//
    body.match(pattern)[1]
  end

end
