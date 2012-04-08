require 'spec_helper'
require 'title_grabber'

describe TitleGrabber do

  describe '#extract_title' do
    it 'should extract titles for comics as of 1034' do
      page = Nokogiri::HTML(file('xkcd_1034.html'))
      title = TitleGrabber.extract_title(page)
      title.should == 'Share Buttons'
    end
  end

end
