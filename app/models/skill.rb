# == Schema Information
#
# Table name: skills
#
#  id          :integer          not null, primary key
#  skill_level :integer
#  skill_title :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_skills_on_user_id  (user_id)
#

class Skill < ApplicationRecord
  belongs_to :user
end
