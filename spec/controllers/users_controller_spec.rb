require 'rails_helper'

describe UsersController, type: :controller do
  describe '#confirm_email' do
    let!(:user) { Fabricate(:user, confirmed_email: false) }

    it 'confirms email' do
      get :confirm_email, { id: user.confirm_token }
      expect(User.last.confirmed_email).to be true
    end
  end

  describe "#create" do
    before do
      @user_params = {user: {username: "name", email: "email@blue", password: "password", password_confirmation: "password" } }
    end

    it 'sends an email to confirm' do
      ActionMailer::Base.deliveries = []
      post :create, @user_params

      mail = ActionMailer::Base.deliveries.last
      expect(mail.subject).to include "Registration Confirmation"
      expect(mail.to).to include "email@blue"
    end
  end
end
