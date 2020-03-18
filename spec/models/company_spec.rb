# == Schema Information
#
# Table name: companies
#
#  id               :integer          not null, primary key
#  about            :string
#  address          :string
#  background_image :string
#  image            :string
#  name             :string
#  tel              :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Company, type: :model do
  describe "company Assosciations" do
    it { should have_many (:advertisings) }
    it { should belong_to (:user) }
  end
end
