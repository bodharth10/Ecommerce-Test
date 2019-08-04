class AddOtpToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :otp, :string
    add_column :users, :otp_verified, :boolean, default: false
  end
end