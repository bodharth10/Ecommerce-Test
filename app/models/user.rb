class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :phone_number, presence: true
  validates :country_code, presence: true
  validates :email, presence: true, uniqueness: true, exclusion: { in: %w(admin) }

  Roles = [ :admin , :default ]

  def admin?
  	self.role == 'admin'
  end
end
