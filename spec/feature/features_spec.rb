require 'order'
require 'menu'



describe 'Features' do

  let(:order) {Order.new}
  describe '#menu' do
    it{expect(order).to respond_to(:menu)}
    it 'displays the menu' do
      expect(order.menu).to include ({:pizza=>12})
    end
  end
  describe '#select_dish' do
    it{expect(order).to respond_to(:select_dish).with(2).argument}
    it 'selects a dish from a menu' do
      dish = order.select_dish('pizza', 2)
      expect(order.selections).not_to be_empty
    end
    it 'raises an error when selection is not valid' do
      expect{order.select_dish('trash', 3)}.to raise_error 'Selection not valid'
    end
  end
end
