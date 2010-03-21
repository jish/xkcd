require 'rubygems'
require 'sinatra'
require 'haml'

require 'lib/image_grabber'
require 'lib/key_grabber'
require 'lib/text_grabber'
require 'lib/title_grabber'

set :haml, {:format => :html5 }

get '/' do
  key = KeyGrabber.current_key

  haml :index, :locals => { :source => ImageGrabber.grab(key),
    :title_text => TextGrabber.grab(key), :title => TitleGrabber.grab(key) }
end

get '/:id' do
  haml :index, :locals => { :source => ImageGrabber.grab(params[:id]),
    :title_text => TextGrabber.grab(params[:id]),
    :title => TitleGrabber.grab(key) }
end
