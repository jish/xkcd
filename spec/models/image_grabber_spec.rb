require 'spec_helper'
require 'image_grabber'

describe ImageGrabber do

  describe '#extract_image' do
    it 'should find image locations as of xkcd 1034' do
      page = Nokogiri::HTML(file('xkcd_1034.html'))
      image = ImageGrabber.extract_image(page)
      image['src'].should == 'http://imgs.xkcd.com/comics/share_buttons.png'
    end
  end

end
