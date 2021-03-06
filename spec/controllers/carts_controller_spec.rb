require "rails_helper"
require "byebug"

RSpec.describe CartsController do
  describe "GET #show" do
    before(:each) { @order = FactoryBot.create(:order) }
    it "dispays items which added in cart" do
      get :show
      assert   @order.order_items.is_a?(ActiveRecord::Associations::CollectionProxy)
    end
  end
end