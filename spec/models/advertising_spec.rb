# == Schema Information
#
# Table name: advertisings
#
#  id              :integer          not null, primary key
#  job_description :text
#  job_title       :string
#  salary          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :integer
#
# Indexes
#
#  index_advertisings_on_company_id  (company_id)
#

require 'rails_helper'

RSpec.describe Advertising, type: :model do
  describe "advertising Assosiations" do
    it { should belong_to(:company) }
  end
end
