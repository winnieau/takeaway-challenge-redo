require 'order'
require 'menu'

describe Order do
  
  
  describe '#display' do
    it{is_expected.to respond_to(:display)}
    
    it 'shows a list of dishes with prices' do
      expect(subject.display).to eq "Burger"
    end
  end
end