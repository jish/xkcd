require 'title_grabber'

describe TitleGrabber do

  it 'should grab the pages title' do
    title = TitleGrabber.grab(716)
    title.should == 'Time Machine'
  end

end
