require 'rubygems'
require 'sinatra/base'
require 'haml'

require 'lib/image_grabber'
require 'lib/key_grabber'
require 'lib/text_grabber'
require 'lib/title_grabber'
require 'page'

class Xkcd < Sinatra::Base

  set :haml, {:format => :html5 }
  set :public, 'public'

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

  get '/envdump' do
    ENV.map { |key, value| ["<strong>#{key}</strong>", value] * ': ' } * '<br />'
  end

  puts public

end
