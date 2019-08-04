class OrderNotifierMailer < ApplicationMailer
  def welcome(current_user, ordered_items)
    @current_user = current_user
    @ordered_items = ordered_items
    mail(to: current_user.email, subject: "Order Details")
  end
end
