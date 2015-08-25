require_relative 'menu'
require_relative 'customer'

class Order
  include Menu

  def initialize
    @dishes = { 'pizza': 12, 'fries': 3, 'soup': 4 }
    @selections = []
    @hashed_selections = {}
  end

  def select_dish(dish, quantity)
    fail 'Selection not valid' unless dish == "pizza" || dish == "fries" || dish == "soup"
    # selections << [dish, quantity]
    # @hashed_selections = Hash[*selections.flatten(1)]
    quantity.times do
      selections << dishes.select do |choice|
        choice = dish
      end
    end
  end

  def breakdown
    price =  selections.map { |cost| cost }.flatten(1).inject(:+)
    puts "#{price}"
  end

  attr_reader :hashed_selections, :selections, :dishes

end
