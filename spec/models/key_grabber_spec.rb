require 'key_grabber'
require 'mocha'

describe KeyGrabber do

  describe '#current_key' do
    it 'should grab the current key' do
      key = KeyGrabber.current_key
      key.should be_a_kind_of String
      key.should =~ /\d+/
    end

    it 'should cache the result' do
      agent = Mechanize.new
      Mechanize.expects(:new).once.returns(agent)

      KeyGrabber.current_key
      KeyGrabber.current_key
    end
  end

  describe '#fresh' do
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