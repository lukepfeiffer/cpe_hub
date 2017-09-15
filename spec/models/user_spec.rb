require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#email_activate' do
    let(:user) { Fabricate(:unconfirmed_user) }

    it 'confirms email' do
      user.email_activate
      expect(user.confirmed_email).to be true
    end
  end

end
