require 'image_grabber'

describe ImageGrabber do

  # TODO Tests should not make actual HTTP requests.
  it 'should grab an images location' do
    location = ImageGrabber.grab(705)
    location.should == 'http://imgs.xkcd.com/comics/devotion_to_duty.png'
  end

end
