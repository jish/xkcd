require 'mechanize'

class KeyGrabber

  def self.current_key
    if fresh? && @current_key
      @current_key
    else
      @last_read = Time.now
      agent = Mechanize.new
      page  = agent.get("http://xkcd.com")
      @current_key = page.at("h3:nth-child(14)").text.delete('^0-9')
    end
  end

  def self.fresh?
    five_minutes = 60 * 5
    expiration   = Time.now - five_minutes

    @last_read.to_i > expiration.to_i
  end

end
