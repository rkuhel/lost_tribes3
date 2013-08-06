class OrderNotifier < ActionMailer::Base
  default from: "support@lostTribes.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def order_confirmation(user)
    @user = user
    mail to: user.email, subject: 'Lost Tribes Order Confirmation'
    mail to: "ryan.kuhel@gmail.com.", subject: 'Lost Tribes Order Confirmation: we have recieved your beer order (mail works)'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def order_shipped(confirmed)
    @order = order
    mail to: ordr.email, subject: 'We have shipped your order.'
    # @greeting = "Hi from ActionMailer shipped method. Your order has been shipped"
    # mail to: "ryan.kuhel@gmail.com"
  end
end
