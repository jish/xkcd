require 'sinatra/base'
require 'haml'

require 'image_grabber'
require 'key_grabber'
require 'text_grabber'
require 'title_grabber'
require 'page'

class Xkcd < Sinatra::Base

  set :haml, {:format => :html5 }
  set :public, 'public'
  set :views, 'views'

  get '/' do
    key = KeyGrabber.current_key
    @page = Page.new(key)

    haml :index, :locals => { :source => ImageGrabber.grab(key),
      :title_text => TextGrabber.grab(key), :title => TitleGrabber.grab(key) }
  end

  get %r{/([\d]+)} do |id|
    @page = Page.new(id)

    haml :index, :locals => { :source => ImageGrabber.grab(id),
      :title_text => TextGrabber.grab(id), :title => TitleGrabber.grab(id) }
  end

  get '/ping' do
    'pong'
  end

end
