require 'spec_helper'
require 'title_grabber'

describe TitleGrabber do

  let(:xkcd_1034_html) { read_file('xkcd_1034.html') }

  describe '#extract_title' do
    it 'should extract titles for comics as of 1034' do
      page = Nokogiri::HTML.parse(xkcd_1034_html)
      title = TitleGrabber.extract_title(page)

      expect(title).to eq('Share Buttons')
    end
  end

end
