require 'spec_helper'
require 'key_grabber'

describe KeyGrabber do

  describe '.current_key' do
    it 'should grab the current key' do
      stub_request(:get, 'https://xkcd.com/').
        to_return(body: file('2020.06.12_xkcd_homepage.html'))

      key = KeyGrabber.current_key

      expect(key).to be_kind_of(String)
      expect(key).to eq('2319')
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

  describe '.fresh' do
    it 'should be fresh within the last five minutes' do
      KeyGrabber.instance_variable_set("@last_read", Time.now - 1)
      expect(KeyGrabber.fresh?).to be_truthy
    end

    it 'should not be fresh if it is more than five minutes old' do
      KeyGrabber.instance_variable_set("@last_read", Time.now - 1000)
      expect(KeyGrabber.fresh?).to be_falsey
    end
  end

end
