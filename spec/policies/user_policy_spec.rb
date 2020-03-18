require 'rails_helper'

describe UserPolicy do
  subject { UserPolicy.new(user, user) }

  let(:user) { FactoryBot.create(:user) }

  context "for admin_user" do
    let(:user) { FactoryBot.create(:admin_user) }

    it { should permit(:show)    }
    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should permit(:destroy) }
  end

  context "for customer_user" do
    let(:user) { FactoryBot.create(:customer_user) }

    it { should permit(:show)    }
    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should_not permit(:destroy) }
  end
end