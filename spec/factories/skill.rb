require 'faker'

FactoryBot.define do
  factory :skill, class: Skill do
    skill_title { 'test' }
    skill_level { 5 }
  end
end