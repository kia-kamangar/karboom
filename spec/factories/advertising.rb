require 'faker'

FactoryBot.define do
  factory :advertising do
    job_title { Faker::Job }
    job_description { Faker::Name.name }
    salary { Faker::Number }
  end
end