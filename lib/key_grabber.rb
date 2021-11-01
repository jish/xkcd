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
    last_read = @last_read || Time.at(0)
    expire_at = last_read + CACHE_TTL

    Time.now < expire_at
  end

  def self.fetch_homepage(timestamp)
    uri = URI.parse("https://xkcd.com/")
    response = Net::HTTP.get(uri)
    @last_read = timestamp

    response
  end

  def self.extract_key(body)
    key = extract_key_legacy(body)

    return key if key

    extract_key_hyperlink(body)
  end

  def self.extract_key_legacy(body)
    pattern = /Permanent link to this comic: https:\/\/xkcd.com\/(\d+)\//
    match = body.match(pattern)

    match && match[1]
  end

  def self.extract_key_hyperlink(body)
    pattern = /Permanent link to this comic: <a href="https:\/\/xkcd.com\/(\d+)/
    match = body.match(pattern)

    match && match[1]
  end

  def self.reset!
    @current_key = nil
    @last_read = nil
  end

end
