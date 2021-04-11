# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  include ShopifyApp::Authenticated

  def current_shop
    ShopifyAPI::Shop.current
  end
end
