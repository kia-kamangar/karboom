require 'faker'

FactoryBot.define do
  factory :company do
    name { 'companyTest' }
    about { 'test' }
    image { nil }
    background_image { nil }
    address { 'test' }
    tel { '123' }
  end
end