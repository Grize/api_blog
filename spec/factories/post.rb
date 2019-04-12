require 'faker'


FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence } 
    body { Faker::Lorem.paragraphs(5) } 
    ip { Faker::Internet.ip_v4_address } 
    total_rating { 5.0 }
    username { Faker::Internet.unique.user_name } 
  end
end