# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  age                    :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  gender                 :boolean
#  image                  :string
#  last_name              :string
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  tel                    :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  customer_id            :integer
#  demand_id              :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :skills
  has_many :resumes
  has_many :demands
  has_one :company
  # mount_uploaders :images, ImageUploader
  # serialize :images, JSON

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:customer, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :customer
  end

  def full_name
    "#{name} #{last_name}"
  end
end
