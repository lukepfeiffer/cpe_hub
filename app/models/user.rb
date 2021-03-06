class User < ActiveRecord::Base
  before_create :confirmation_token
  has_many :discussions

  include Authem::User

  validates_presence_of :email, :username
  validates_uniqueness_of :username

  def access_rights?(min_level)
    access_level >= min_level
  end

  def email_activate
    self.confirmed_email = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s
  end
end
