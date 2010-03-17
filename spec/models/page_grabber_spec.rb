require 'page_grabber'

describe PageGrabber do

  it 'should grab a page' do
    page = PageGrabber.grab(709)
    page.should be_a_kind_of Mechanize::Page
  end

  it 'should not make two requests for the same page' do
    PageGrabber.agent_queries = 0
    page = PageGrabber.grab(707)
    page = PageGrabber.grab(707)
    PageGrabber.agent_queries.should == 1
  end

end
