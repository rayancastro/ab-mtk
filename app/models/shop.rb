# frozen_string_literal: true
class Shop < ActiveRecord::Base
  include ShopifyApp::ShopSessionStorage

  def api_version
    ShopifyApp.configuration.api_version
  end

  def with_shopify!
    # TODO: If you want to work with another shop, you'll first need to clear the session:
    ShopifyAPI::Base.clear_session
    session = ShopifyAPI::Session.new(domain: shopify_domain, token: shopify_token, api_version: api_version)
    ShopifyAPI::Base.activate_session(session)
  end
end
