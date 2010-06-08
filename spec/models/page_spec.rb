require 'page'

puts ENV.inspect

describe Page do

  describe '#id' do
    it 'should provide the given id' do
      page = Page.new(700)
      page.id.should == 700
    end

    it 'should return a Fixnum' do
      page = Page.new('701')
      page.id.should == 701
      page.id.should be_a Fixnum
    end
  end

end
