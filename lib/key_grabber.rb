require 'net/http'

class KeyGrabber

  def self.current_key
    if fresh? && @current_key
      @current_key
    else
      @last_read = Time.now

      response = Net::HTTP.start('xkcd.com', 80) { |http| http.get('/') }
      pattern  = /Permanent link to this comic: http:\/\/xkcd.com\/(\d+)\//
      response.body.match(pattern)[1]
    end
  end

  def self.fresh?
    five_minutes = 60 * 5
    expiration   = Time.now - five_minutes

    @last_read.to_i > expiration.to_i
  end

end
