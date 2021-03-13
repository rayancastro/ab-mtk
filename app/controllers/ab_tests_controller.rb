class AbTestsController < ApplicationController
  before_action :set_ab_test, only: [:show, :edit, :update]
  def index
    @ab_tests = AbTest.all
  end

  def show
  end

  def new
    @ab_test = AbTest.new
  end

  def create
    @ab_test = AbTest.new(ab_test_params)
    if @ab_test.save
      redirect_to ab_test_path(@ab_test)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ab_test.update(ab_test_params)
      redirect_to ab_test_path(@ab_test)
    else
      render :edit
    end
  end


  private

  def set_ab_test
    @ab_test = AbTest.find(params[:id])
  end

  def ab_test_params
    params.require(:ab_test).permit(:name, :active)
  end
end
