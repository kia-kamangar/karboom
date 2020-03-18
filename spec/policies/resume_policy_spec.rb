require 'rails_helper'

describe ResumePolicy do
  subject { ResumePolicy.new(user, resume) }

  let(:resume) { FactoryBot.create(:resume) }

  context "for admin_user" do
    let(:user) { FactoryBot.create(:admin_user) }

    it { should     permit(:show)    }
    it { should     permit(:create)  }
    it { should     permit(:new)     }
    it { should     permit(:update)  }
    it { should_not permit(:destroy) }
  end

  context "for customer_user" do
    let(:user) { FactoryBot.create(:customer_user) }

    it { should permit(:show)    }
    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should permit(:destroy) }
  end
end