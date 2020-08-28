require 'spec_helper'
require 'page_grabber'

describe PageGrabber do
  let(:xkcd_1034_html) { read_file('xkcd_1034.html') }

  before do
    PageGrabber.reset!
    WebMock.reset!
  end

  it 'should grab a page' do
    stub_request(:get, 'https://xkcd.com/1034/')
      .to_return(status: 200, body: xkcd_1034_html)

    page = PageGrabber.grab(1034)

    title = page.at('title')
    expect(title.text).to eq('xkcd: Share Buttons')
  end

  it 'should not make two requests for the same page' do
    stub = stub_request(:get, 'https://xkcd.com/1034/')
           .to_return(status: 200, body: xkcd_1034_html)

    PageGrabber.grab(1034)

    expect(stub).to have_been_requested.times(1)
  end
end
