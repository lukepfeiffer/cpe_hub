class AdminsController < ApplicationController
  # before_action :authenticate_admin, only: [:overview]

  expose :faqs do
    Faq.limit(5).order('id desc')
  end

  expose :courses do
    Course.limit(5).order('id desc')
  end

  def overview
  end
end
