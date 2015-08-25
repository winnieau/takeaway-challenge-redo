require_relative 'menu'
require_relative 'customer'

class Order
  include Menu

  def initialize
    @dishes = { 'pizza': 12, 'fries': 3, 'soup': 4 }
  end

  def select_dish(dish, quantity)
  end
end
