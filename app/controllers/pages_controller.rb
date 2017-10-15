class PagesController < ApplicationController
  expose :courses do
    Course.all.last(20)
  end

  expose :discussions do
    Discussion.all.last(10)
  end

  expose :professors do
    Professor.all.last(5)
  end

  def home
  end

  def log_in
  end

  def about
  end

  def contact
  end
end
