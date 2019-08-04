def login_admin
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryBot.create(:user)
    user.update_columns(role: "admin")
    sign_in user
  end
end

def login_user
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryBot.create(:user)
    sign_in user
  end
end

def save_otp
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryBot.create(:user)
    user.update_columns(otp: "1234")
    sign_in user
  end
end

def create_order(product)
  @order = FactoryBot.create(:order)
  @order.update({product: product})
  @order_item = @order.order_items.new(product: product, quantity: 1)
  @order.save
  session[:order_id] = @order.id
end
