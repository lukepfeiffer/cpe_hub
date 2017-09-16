class FaqsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :new, :edit, :update]

  expose :faq
  expose :faqs do
    Faq.all
  end

  def edit
  end

  def update
    faq = Faq.find(params[:id])
    faq.user_id = current_user.id

    if faq.update(faq_params)
      flash[:success] = "FAQ successfully updated!"
      redirect_to faq_path(faq.id)
    else
      flash[:danger] = "Something went wrong..."
      render :edit
    end
  end

  def new
  end

  def create
    faq = Faq.new(faq_params)
    faq.user_id = current_user.id

    if faq.save
      flash[:success] = "FAQ successfully created!"
      redirect_to faq_path(faq.id)
    else
      flash[:danger] = "Something went wrong..."
      render :new
    end
  end

  def index
  end

  def show
  end

  private

  def faq_params
    params.require(:faq).permit(
      :answer,
      :question
    )
  end
end
