require 'rails_helper'

describe AdvertisingPolicy do
  subject { AdvertisingPolicy.new(user, advertising) }

  let(:advertising) { FactoryBot.create(:advertising) }

  context "for admin_user" do
    let(:user) { FactoryBot.create(:admin_user) }

    it { should permit(:show)    }
    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should permit(:destroy) }
  end

  context "for customer_user" do
    let(:user) { FactoryBot.create( :customer_user) }

    it { should permit(:index) }
    it { should permit(:show)    }
    it { should_not permit(:create)  }
    it { should_not permit(:update)  }
    it { should_not permit(:destroy) }
  end
end