# frozen-string-literal: true

require 'spec_helper'
require 'caption_grabber'

describe CaptionGrabber do
  describe '#extract_text' do
    it 'extracts a caption from a Nokogiri document' do
      document = Nokogiri::HTML(file('xkcd_1034.html'))
      expected = 'The only post to achieve perfect balance between the four' +
        ' was a hilarious joke about Mark Zuckerberg getting caught using a' +
        ' pseudonym to sneak past the TSA.'

      text = CaptionGrabber.extract_text(document)

      expect(text).to eq(expected)
    end
  end
end
