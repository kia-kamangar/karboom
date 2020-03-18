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

class Company < ApplicationRecord
  has_many :advertisings
  belongs_to :user

  mount_uploaders :image, ImageUploader
  serialize :image, JSON
end
