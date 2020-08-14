class ReviewsController < ApplicationController


  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @reservation = Reservation.find(params[:reservation_id])
    @review.reservation = @reservation
    if @review.save
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:note, :content)
  end
end
