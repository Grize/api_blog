FactoryBot.define do
  factory :user do
    name { Faker::Internet.unique.user_name }
  end
end