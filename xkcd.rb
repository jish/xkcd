require 'rubygems'
require 'sinatra'
require 'haml'

require 'lib/image_grabber'
require 'lib/text_grabber'

# TODO change this hard-coded id to use the KeyGrabber
get '/' do
  haml :index, :locals => { :source => ImageGrabber.grab(706),
    :title_text => TextGrabber.grab(:index) }
end

get '/:id' do
  haml :index, :locals => { :source => ImageGrabber.grab(params[:id]),
    :title_text => TextGrabber.grab(params[:id]) }
end
