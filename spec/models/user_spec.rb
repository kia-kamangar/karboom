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

require 'rails_helper'

RSpec.describe User, type: :model do

  context 'Enumerations' do
    it { is_expected.to respond_to :admin?    }
    it { is_expected.to respond_to :customer? }
  end

  describe "user assosiations" do
    it { should have_many(:skills)    }
    it { should have_many(:resumes)   }
    it { should have_many(:demands)   }
    it { should have_one(:company) }
  end

end
