require 'page_grabber'

class CountingPageGrabber < PageGrabber

  class << self
    attr_accessor :agent_queries
  end

  def self.agent
    @agent_queries += 1
    super
  end

end



describe PageGrabber do

  it 'should grab a page' do
    FakeWeb.register_uri(:get, 'https://xkcd.com/1034/',
      :body => file('xkcd_1034.html'))
    page = PageGrabber.grab(1034)
    page.at("title").text.should eq("xkcd: Share Buttons")
  end

  it 'should not make two requests for the same page' do
    FakeWeb.register_uri(:get, 'https://xkcd.com/1035/',
      :body => file('xkcd_1034.html'))
    CountingPageGrabber.agent_queries = 0
    page = CountingPageGrabber.grab(1035)
    page = CountingPageGrabber.grab(1035)
    CountingPageGrabber.agent_queries.should == 1
  end

end
