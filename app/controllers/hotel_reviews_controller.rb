class HotelReviewsController < ApplicationController
  before_action :set_hotel_review, only: [:show, :edit, :update, :destroy]

  # GET /hotel_reviews
  # GET /hotel_reviews.json
  def index
    @hotel_reviews = HotelReview.all
  end

  # GET /hotel_reviews/1
  # GET /hotel_reviews/1.json
  def show
  end

  # GET /hotel_reviews/new
  def new
    @hotel_review = HotelReview.new
    respond_to do |format|
    format.html
    format.js
    end
  end

  # GET /hotel_reviews/1/edit
  def edit
  end

  # POST /hotel_reviews
  # POST /hotel_reviews.json
  def create
    @hotel_review = HotelReview.new(hotel_review_params)

    respond_to do |format|
      if @hotel_review.save
        format.html { redirect_to @hotel_review, notice: 'Hotel review was successfully created.' }
        format.json { render :show, status: :created, location: @hotel_review }
      else
        format.html { render :new }
        format.json { render json: @hotel_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotel_reviews/1
  # PATCH/PUT /hotel_reviews/1.json
  def update
    respond_to do |format|
      if @hotel_review.update(hotel_review_params)
        format.html { redirect_to @hotel_review, notice: 'Hotel review was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel_review }
      else
        format.html { render :edit }
        format.json { render json: @hotel_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotel_reviews/1
  # DELETE /hotel_reviews/1.json
  def destroy
    @hotel_review.destroy
    respond_to do |format|
      format.html { redirect_to hotel_reviews_url, notice: 'Hotel review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel_review
      @hotel_review = HotelReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotel_review_params
      params.require(:hotel_review).permit(:user_id, :hotel_id, :comment, :space_rating, :service_rating, :security_rating, :clean_rating)
    end
end
