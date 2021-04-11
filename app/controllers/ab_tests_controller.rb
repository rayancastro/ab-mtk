class AbTestsController < AuthenticatedController
  before_action :set_ab_test, only: [:show, :edit, :update]
  before_action :verbose_shopify

  def index
    @ab_tests = current_shop.ab_tests
  end

  def show
  end

  def new
    @ab_test = AbTest.new
  end

  def create
    @ab_test = AbTest.new(ab_test_params)
    @ab_test.shop = current_shop
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
    @ab_test = current_shop.ab_tests.find(params[:id])
  end

  def ab_test_params
    params.require(:ab_test).permit(:name, :active)
  end

  def verbose_shopify
    puts "Verbose"
    p current_shop
    p current_shopify_domain
  end
end
