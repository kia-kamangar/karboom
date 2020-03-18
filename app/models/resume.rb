# == Schema Information
#
# Table name: resumes
#
#  id           :integer          not null, primary key
#  end_date     :date
#  resume_title :string
#  start_date   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
# Indexes
#
#  index_resumes_on_user_id  (user_id)
#

class Resume < ApplicationRecord
  belongs_to :user
end
