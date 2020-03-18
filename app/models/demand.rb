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

class Demand < ApplicationRecord
  belongs_to :user
end
