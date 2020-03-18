require 'rails_helper'

describe SkillPolicy do
  subject { SkillPolicy.new(user, skill) }

  let(:skill) { FactoryBot.create :skill }

  context "for admin_user" do
    let(:user) { FactoryBot.create (:admin_user) }

    it { should     permit(:show)    }
    it { should     permit(:create)  }
    it { should     permit(:new)     }
    it { should     permit(:update)  }
    it { should permit(:destroy) }
  end

  context "for user" do
    let(:user) { FactoryBot.create(:customer_user) }

    it { should permit(:show)    }
    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should permit(:destroy) }
  end
end