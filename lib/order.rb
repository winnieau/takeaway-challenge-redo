require_relative 'menu'

class Order
  include Menu

  def initialize
    @dishes = { 'pizza': 12, 'fries': 3, 'soup': 4 }
  end
end
