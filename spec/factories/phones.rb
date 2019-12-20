FactoryBot.define do
  factory :phone do
    person { nil }
    ddd { "MyString" }
    number { "MyString" }
    type { 1 }
    preferential { false }
  end
end
