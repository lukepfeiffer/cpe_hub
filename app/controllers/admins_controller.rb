class AdminsController < ApplicationController
  expose :faqs do
    Faq.limit(5).order('id desc')
  end

  def overview
  end
end
