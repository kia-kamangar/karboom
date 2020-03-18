require 'faker'

FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { Faker::Internet.email }
    password { '111111A' }
  end

  factory :admin_user ,class: User do
    sequence(:email) { Faker::Internet.email }
    password { '111111A' }
    role { :admin }
  end

  factory :customer_user, class: User do
    sequence(:email) { Faker::Internet.email }
    password { '111111A' }
    role { :customer }
  end
 end