class SegmentsController < ApplicationController
  before_action :set_ab_test, only: [:new, :create]

  def new
    @segment = Segment.new
  end

  def create
    @segment = Segment.new(segment_params)
    @segment.ab_test = @ab_test
    if @segment.save
      redirect_to ab_test_path(@ab_test)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  private
  def set_ab_test
    @ab_test = AbTest.find(params[:ab_test_id])
  end

  def segment_params
    params.require(:segment).permit(:name, :url)
  end
end
