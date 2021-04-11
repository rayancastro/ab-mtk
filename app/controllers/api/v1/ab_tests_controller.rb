class Api::V1::AbTestsController < Api::V1::BaseController
  # protect_from_forgery, except: :ab_test_data
  def ab_test_data
    @ab_test = AbTest.find_by(token: params[:token])

    segment = @ab_test.segments.sample
    segment.total_views += 1
    segment.save

    render json: { segment_url: segment.url }
  end

  def js_lib
    render file: '/api/v1/ab_tests/js_lib', handlers: [:erb], formats: [:js], locals: { name: "John" }, layout: false
    # format.js do
    #   render "segment_rendering", layout: false
    # end
  end
end
