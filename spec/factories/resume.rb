require 'faker'

FactoryBot.define do
  factory :resume, class: Resume do
    resume_title {'test'}
    start_date {nil}
    end_date {nil}
  end
end