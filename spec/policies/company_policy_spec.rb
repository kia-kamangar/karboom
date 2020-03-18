require 'rails_helper'

describe CompanyPolicy do
  subject { CompanyPolicy.new(user, company) }

  let(:company) { FactoryBot.create(:company) }

  context "for admin_user" do
    let(:user) { FactoryBot.create :admin_user }

    it { should permit(:show)    }
    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should permit(:destroy) }
  end
end