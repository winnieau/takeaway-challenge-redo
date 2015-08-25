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
  end
end
