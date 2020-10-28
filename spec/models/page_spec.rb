require 'page'

describe Page do
  describe '#id' do
    it 'should provide the given id' do
      page = Page.new(700)
      expect(page.id).to eq(700)
    end

    it 'should return a Fixnum' do
      page = Page.new('701')

      expect(page.id).to eq(701)
      expect(page.id).to be_a_kind_of(Integer)
    end
  end
end
