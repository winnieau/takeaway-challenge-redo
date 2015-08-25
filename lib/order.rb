require_relative 'menu'
require_relative 'customer'

class Order
  include Menu

  def initialize
    @dishes = { 'pizza': 12, 'fries': 3, 'soup': 4 }
    @selections = []
  end

  def select_dish(dish, quantity)
    fail 'Selection not valid' unless dish == "pizza" || dish == "fries" || dish == "soup"
    selections << [dish, quantity]
  end


  attr_reader :selections

end
