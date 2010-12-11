require 'spec_helper'
require 'key_grabber'
require 'fakeweb'

FakeWeb.allow_net_connect = false

describe KeyGrabber do

  describe '.current_key' do
    it 'should grab the current key' do
      FakeWeb.register_uri(:get, 'http://xkcd.com/',
        :body => file('2010.12.11_xkcd_homepage.html'))

      key = KeyGrabber.current_key
      key.should be_a_kind_of String
      key.should == '832'
    end

    it 'should be resistant to change' do
      FakeWeb.register_uri(:get, 'http://xkcd.com/',
        :body => 'Permanent link to this comic: http://xkcd.com/1/')

      key = KeyGrabber.current_key
      key.should be_a_kind_of String
      key.should == '1'
    end
  end

  describe '.fresh' do
    it 'should be fresh within the last five minutes' do
      KeyGrabber.instance_variable_set("@last_read", Time.now - 1)
      KeyGrabber.fresh?.should == true
    end

    it 'should not be fresh if it is more than five minutes old' do
      KeyGrabber.instance_variable_set("@last_read", Time.now - 1000)
      KeyGrabber.fresh?.should == false
    end
  end

end
