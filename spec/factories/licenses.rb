FactoryBot.define do
  factory :license do
    person { nil }
    number { "MyString" }
    validity { "2019-12-20" }
  end
end
