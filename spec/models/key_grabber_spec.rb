require 'key_grabber'

describe KeyGrabber do
  it "should grab current key location" do
    key = KeyGrabber.current_key
    key.should be_a_kind_of String
  end
end