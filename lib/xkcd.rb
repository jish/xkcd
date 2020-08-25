require 'sinatra/base'
require 'haml'

require 'image_grabber'
require 'key_grabber'
require 'caption_grabber'
require 'title_grabber'
require 'page'

##
# Holds the main Sinatra application
#
class Xkcd < Sinatra::Base

  set :haml, {:format => :html5 }
  set :public_dir, 'public'
  set :views, 'views'

  get '/' do
    key = KeyGrabber.current_key
    @page = Page.new(key)

    haml :index, :locals => { :source => ImageGrabber.grab(key),
      :caption => CaptionGrabber.grab(key), :title => TitleGrabber.grab(key) }
  end

  get %r{/([\d]+)} do |id|
    @page = Page.new(id)

    haml :index, :locals => { :source => ImageGrabber.grab(id),
      :caption => CaptionGrabber.grab(id), :title => TitleGrabber.grab(id) }
  end

  get '/ping' do
    'pong'
  end

end
