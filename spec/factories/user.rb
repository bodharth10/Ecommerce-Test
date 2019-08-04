FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    # password "password"
    # password_confirmation "password"
    # phone_number "9999999999"
    # country_code "91"
  end
end
