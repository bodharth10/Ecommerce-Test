class PaymentsController < ApplicationController

  def create
    current_user.generate_pin
    current_user.send_pin
    respond_to do |format|
      format.js
    end
  end

  def order_verification
    if current_user.otp_verification(params[:pin])
       OrderNotifierMailer.welcome(current_user,current_order.order_items).deliver_now! rescue nil
      current_order.order_items.each do |each_order|
        order = current_user.orders.create(product_id: each_order.product_id, user: current_user)
        order.update({total: each_order.total_price, quantity: each_order.quantity})
      end
      current_order.order_items.update({order_id: nil})
    end
    respond_to do |format|
      format.js
    end
  end
end
