class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.confirm_order.subject
  #
  def confirm_order
    @greeting = "Hi"

    @user = user
    mail to: user.email, subject: "Confirm order"
  end
  end
end
