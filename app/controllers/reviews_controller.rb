class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  def index
    @reviews = Review.all
  end

  def show; end

  def new
    @review = Review.new
  end

  def edit; end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review, notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: "Review was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path, notice: "Review was successfully deleted."
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:participant_id, :reviewable_id, :reviewable_type, :rating, :comment)
  end
end
