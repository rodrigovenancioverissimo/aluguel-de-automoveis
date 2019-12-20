FactoryBot.define do
  factory :admin do
    email Faker::Internet.email
    password '123465'
    password_confirmation '123465'
  end
end