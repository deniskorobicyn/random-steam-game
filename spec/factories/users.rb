FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password '123456789'
    password_confirmation '123456789'
    steamid "76561198094432345"
  end
end
