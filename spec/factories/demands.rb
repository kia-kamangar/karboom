# == Schema Information
#
# Table name: demands
#
#  id              :integer          not null, primary key
#  job_description :text
#  job_title       :string
#  salary          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

FactoryBot.define do
  factory :demand do
    job_title { Faker::Job }
    job_description { Faker::Name.name }
    salary { Faker::Number }
  end
end
