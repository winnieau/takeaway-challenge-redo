require_relative 'menu'
require_relative 'customer'
require 'twilio-ruby'


class Order
  include Menu

  def initialize
    @dishes = { 'pizza'=> 12, 'fries'=> 3, 'soup'=> 4 }
    @selections = []
    @hashed_selections = {}
  end

  attr_reader :hashed_selections, :selections, :dishes

  def select_dish(dish, quantity)
    fail 'Selection not valid' unless dish == "pizza" || dish == "fries" || dish == "soup"
    selections << [dish, quantity]
    @hashed_selections = Hash[*selections.flatten(1)]
  end

  def breakdown
    @total_price = []
    @price_totals = []
    @hashed_selections.inject(0) do |result, (key, value)|
      val = dishes.fetch(key)
      total_value = val * value
      @total_price << [key, total_value]
      @price_totals << total_value
    end

    @total_price.each do |dish, price|
      puts "#{dish}, $#{price}"
    end
  end

  def total_price
    @price_totals.inject(:+)
  end

  def place_order customer
    fail 'No dishes selected' if selections.empty?
    @time_order = Time.now + 3600
    send_text_message
    customer.affirmative
  end

  def send_text_message
    # Get your Account Sid and Auth Token from twilio.com/user/account
  account_sid = 'ACd20534bbb6a0aec9f76e2975230e0db6'
  auth_token = '10de356b4197cb57e2fa960929edc1e7'
  @client = Twilio::REST::Client.new account_sid, auth_token

  message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{@time_order}",
      :to => "+14438470764",     # Replace with your phone number
      :from => "+14437013745")   # Replace with your Twilio number
  puts message.sid
  end

end
