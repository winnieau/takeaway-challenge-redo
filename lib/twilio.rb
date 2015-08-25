

module Twilio
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
