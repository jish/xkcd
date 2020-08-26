require 'spec_helper'
require 'image_grabber'

describe ImageGrabber do
  let(:xkcd_1034_html) { read_file('xkcd_1034.html') }
  let(:xkcd_2349_html) { read_file('xkcd_2349.html') }

  describe '.extract_image' do
    it 'should find image locations as of xkcd 1034' do
      document = Nokogiri::HTML.parse(xkcd_1034_html)
      image = ImageGrabber.extract_image(document)

      expect(image['src'])
        .to eq('http://imgs.xkcd.com/comics/share_buttons.png')
    end

    it 'should find image locations as of xkcd 2349' do
      document = Nokogiri::HTML.parse(xkcd_2349_html)
      image = ImageGrabber.extract_image(document)

      expect(image['src'])
        .to eq('//imgs.xkcd.com/comics/rabbit_introduction.png')
    end
  end

  describe '.grab' do
    it 'returns a protocol relative image URL' do
      stub_request(:get, 'https://xkcd.com/1034/')
        .to_return(body: xkcd_1034_html)

      image_source = ImageGrabber.grab(1034)

      expect(image_source).to eq('//imgs.xkcd.com/comics/share_buttons.png')
    end
  end
end
