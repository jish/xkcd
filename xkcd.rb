require 'rubygems'
require 'sinatra'
require 'haml'

image_map = {
  :index => 'http://imgs.xkcd.com/comics/freedom.png',
  '705'  => 'http://imgs.xkcd.com/comics/devotion_to_duty.png'
}

get '/' do
  haml :index, :locals => { :source => image_map[:index] }
end

get '/:id' do
  haml :index, :locals => { :source => image_map[params[:id]] }
end
