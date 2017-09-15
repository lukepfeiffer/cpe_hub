class FaqsController < ApplicationController
  expose :faqs do
    Faq.all
  end

  def index
  end
end
