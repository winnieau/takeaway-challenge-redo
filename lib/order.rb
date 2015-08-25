require_relative 'menu'
require_relative 'customer'

class Order
  include Menu

  def initialize
    @dishes = { 'pizza'=> 12, 'fries'=> 3, 'soup'=> 4 }
    @selections = []
    @hashed_selections = {}

  end

  def select_dish(dish, quantity)
    fail 'Selection not valid' unless dish == "pizza" || dish == "fries" || dish == "soup"
    selections << [dish, quantity]
    @hashed_selections = Hash[*selections.flatten(1)]
  end

  def breakdown
    @total_price = []
    hashed_selections.inject(0) do |result, (key, value)|
      val = dishes.fetch(key)
      total_value = val * value
      @total_price << [key, total_value]
    end
    @total_price.each do |dish, price|
      puts "#{dish}, $#{price}"
    end
  end

  attr_reader :hashed_selections, :selections, :dishes

end
