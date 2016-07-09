class UserMailer < ApplicationMailer
  default from: 'confimation@aharestaurant.com'
  
  def confirmation_order(user_info)
    @user = user_info
    mail(to: @user[:email], subject: "Your order at Aha Restaurant is confirmed! #{@user[:email]}")    
  end
end
