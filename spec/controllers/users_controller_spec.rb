require 'rails_helper'

describe UsersController, type: :controller do
  describe '#confirm_email' do
    let!(:user) { Fabricate(:user, confirmed_email: false) }

    it 'confirms email' do
      get :confirm_email, { id: user.confirm_token }
      expect(User.last.confirmed_email).to be true
    end
  end
end
