require 'spec_helper'
require 'key_grabber'

describe KeyGrabber do

  describe '.current_key' do
    before do
      KeyGrabber.reset!
    end

    it 'should grab the current key' do
      stub_request(:get, 'https://xkcd.com/').
        to_return(body: file('2020.06.12_xkcd_homepage.html'))

      key = KeyGrabber.current_key

      expect(key).to be_kind_of(String)
      expect(key).to eq('2319')
    end

    it 'should cache the results once it finds the current key' do
      stub_request(:get, 'https://xkcd.com/').
        to_return(body: file('2020.06.12_xkcd_homepage.html'))

      KeyGrabber.current_key
      KeyGrabber.current_key

      expect(a_request(:get, 'https://xkcd.com/')).to have_been_made.times(1)
    end

    it 'should refresh the cache when the cache is stale' do
      stub_request(:get, 'https://xkcd.com/').
        to_return(body: file('2020.06.12_xkcd_homepage.html'))
      yesterday = Time.now - (24 * 60 * 60)

      KeyGrabber.fetch_homepage(yesterday)
      KeyGrabber.current_key

      expect(a_request(:get, 'https://xkcd.com/')).to have_been_made.times(2)
    end
  end

  it 'extracts keys from the response body' do
    body = <<-HTML
      <html>
        <br />
        Permanent link to this comic: https://xkcd.com/1234/<br />
      </html>
    HTML

    key = KeyGrabber.extract_key(body)

    expect(key).to eq('1234')
  end

end
