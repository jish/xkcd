require 'rubygems'
require 'sinatra/base'
require 'haml'

require 'lib/image_grabber'
require 'lib/key_grabber'
require 'lib/text_grabber'
require 'lib/title_grabber'

class Xkcd < Sinatra::Base

  set :haml, {:format => :html5 }

  get '/' do
    key = KeyGrabber.current_key

    haml :index, :locals => { :source => ImageGrabber.grab(key),
      :title_text => TextGrabber.grab(key), :title => TitleGrabber.grab(key) }
  end

  get %r{/([\d]+)} do |id|
    haml :index, :locals => { :source => ImageGrabber.grab(id),
      :title_text => TextGrabber.grab(id), :title => TitleGrabber.grab(id) }
  end

end
