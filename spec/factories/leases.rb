FactoryBot.define do
  factory :lease do
    person { nil }
    automobile { nil }
    start_time { "2019-12-20 15:44:29" }
    end_time { "2019-12-20 15:44:29" }
    entry_time { "2019-12-20 15:44:29" }
    exit_time { "2019-12-20 15:44:29" }
  end
end
