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
    page = PageGrabber.grab(709)
    page.should be_a_kind_of Mechanize::Page
  end

  it 'should not make two requests for the same page' do
    CountingPageGrabber.agent_queries = 0
    page = CountingPageGrabber.grab(707)
    page = CountingPageGrabber.grab(707)
    CountingPageGrabber.agent_queries.should == 1
  end

end
