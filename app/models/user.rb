class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :phone_number, presence: true
  validates :country_code, presence: true
  validates :email, presence: true, uniqueness: true, exclusion: { in: %w(admin) }

  has_many :orders
  has_many :products, through: :orders

  Roles = [ :admin , :default ]

  def admin?
  	self.role == 'admin'
  end

  def generate_pin
    self.otp = rand(0000..9999).to_s.rjust(4, "0")
    save
  end
  
  def send_pin
    begin
      mob_number = "+" + country_code + phone_number unless country_code.match("\\+")
      twilio_client.messages.create( to: mob_number, from: "+12055830340", body: "Your one time password for order is : #{otp}")
    rescue Exception => e
      puts e.message
    end
  end
   
  def twilio_client
    Twilio::REST::Client.new("ACf9504cfab323c4160443a57310a12f4f","19a53c123f50c6699caf04de62b31503")
  end

  def otp_verification(entered_pin)
    if self.otp == entered_pin
      update_columns(otp_verified: true)
    end
  end
end
