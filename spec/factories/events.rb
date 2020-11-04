FactoryBot.define do
  factory :event do
    title      {Faker::Name.initials}
    body       {Faker::Lorem.sentence}
    start_date {'2020-10-31 06:00:00'}
    end_date   {'2020-11-01 06:00:00'}
    association :user
  end
end