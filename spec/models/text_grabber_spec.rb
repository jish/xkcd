require 'spec_helper'
require 'text_grabber'

describe TextGrabber, 'grab' do

  describe '#extract_text' do
    page = Nokogiri::HTML(file('xkcd_1034.html'))
    text = TextGrabber.extract_text(page)
    text.should == 'The only post to achieve perfect balance between the four was a hilarious joke about Mark Zuckerberg getting caught using a pseudonym to sneak past the TSA.'
  end

end
