require 'text_grabber'

describe TextGrabber, 'grab' do
  it 'should grab the text for a given id' do
    text = TextGrabber.grab('705')
    text.should == "The weird sense of duty really good sysadmins have can border on the sociopathic, but it's nice to know that it stands between the forces of darkness and your cat blog's servers."
  end
end
