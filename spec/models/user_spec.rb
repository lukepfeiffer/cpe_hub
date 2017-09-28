require 'rails_helper'

describe User do
  describe "#access_rights" do
    let(:user) { Fabricate(:user) }
    let(:admin) { Fabricate(:admin) }
    let(:super_user) { Fabricate(:super_user) }
    let(:user_access_level) { 1 }
    let(:admin_access_level) { 4 }
    let(:super_user_access_level) { 5 }

    context "normal user access level" do
      it "allows user access" do
        expect( user.access_rights?( user_access_level ) ).to be true
      end

      it "allows admin access" do
        expect( admin.access_rights?( user_access_level ) ).to be true
      end

      it "allows super_user access" do
        expect( super_user.access_rights?( user_access_level ) ).to be true
      end
    end

    context "admin access level" do
      it "does not allow user access" do
        expect( user.access_rights?( admin_access_level ) ).to be false
      end

      it "allows admin access" do
        expect( admin.access_rights?( admin_access_level ) ).to be true
      end

      it "allows super_user access" do
        expect( super_user.access_rights?( admin_access_level ) ).to be true
      end
    end

    context "super user access level" do
      it "does not allow user access" do
        expect( user.access_rights?( super_user_access_level ) ).to be false
      end

      it "allows admin access" do
        expect( admin.access_rights?( super_user_access_level ) ).to be false
      end

      it "allows super_user access" do
        expect( super_user.access_rights?( super_user_access_level ) ).to be true
      end
    end
  end

  describe "#email_activate" do
    let(:unconfirmed_user) { Fabricate(:unconfirmed_user) }

    it "confirms email" do
      unconfirmed_user.email_activate
      expect(unconfirmed_user.confirmed_email).to be true
      expect(unconfirmed_user.confirm_token).to be nil
    end
  end
end
