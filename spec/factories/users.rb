FactoryBot.define do
  factory :user do
    name              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {'test1234'}
    password_confirmation {'test1234'}
  end
end
