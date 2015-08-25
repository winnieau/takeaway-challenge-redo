require 'order'
require 'menu'


describe Order do


  describe '#menu' do
    it{is_expected.to respond_to(:menu)}
    it 'shows a list of dishes with prices' do
      expect(subject.menu).to include ({:pizza=>12})
    end
  end

  describe '#select_dish' do
    it{is_expected.to respond_to(:select_dish).with(2).argument}
  end
end
