require 'rubygems'
require 'sinatra'
require 'haml'

require 'lib/image_grabber'
require 'lib/key_grabber'
require 'lib/text_grabber'

get '/' do
  haml :index, :locals => { :source =>
    ImageGrabber.grab(KeyGrabber.current_key),
    :title_text => TextGrabber.grab(:index) }
end

get '/:id' do
  haml :index, :locals => { :source => ImageGrabber.grab(params[:id]),
    :title_text => TextGrabber.grab(params[:id]) }
end
