SHOPIFY_SCOPES = %w[
    read_content
    write_content
    read_themes
    write_themes
    read_product_listings
    read_customers
    write_customers
    read_draft_orders
    write_draft_orders
    read_inventory
    write_inventory
    read_locations
    read_script_tags
    write_script_tags
    read_shipping
    write_shipping
    read_checkouts
    write_checkouts
    read_reports
    write_reports
    read_price_rules
    write_price_rules
    read_marketing_events
    write_marketing_events
    read_resource_feedbacks
    write_resource_feedbacks
    read_shopify_payments_payouts
    read_orders
    write_orders
    read_products
    write_products
    read_fulfillments
    write_fulfillments
    read_discounts
    write_discounts
].join(',')

ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = ENV['SHOPIFY_API_KEY']
  config.secret = ENV['SHOPIFY_SECRET']
  config.old_secret = ""
  config.scope = SHOPIFY_SCOPES # Consult this page for more scope options:
  # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = false
  # For testing webhook
  # go to https://domain.myshopify.com/admin/settings/notifications scroll down
  # found text: All your webhooks will be signed with 'token' so you can verify their integrity.
  # replace SHOPIFY_SECRET value in config/application.yml with this 'token'
  # config.webhook_jobs_namespace = 'webhooks'
  # config.webhooks = [
  #     { topic: 'orders/create', address: "#{ENV['SHOPIFY_WEBHOOK_BASE_URL']}/webhooks/orders", format: 'json' },
  #     { topic: 'orders/updated', address: "#{ENV['SHOPIFY_WEBHOOK_BASE_URL']}/webhooks/orders_updated", format: 'json' },
  #     { topic: 'refunds/create', address: "#{ENV['SHOPIFY_WEBHOOK_BASE_URL']}/webhooks/refunds", format: 'json' }
  # ]
  config.after_authenticate_job = false
  config.api_version = "2021-01"
  ShopifyAPI::Base.api_version = config.api_version
  config.shop_session_repository = 'Shop'
end
# ShopifyApp::Utils.fetch_known_api_versions                        # Uncomment to fetch known api versions from shopify servers on boot
# ShopifyAPI::ApiVersion.version_lookup_mode = :raise_on_unknown    # Uncomment to raise an error if attempting to use an api version that was not previously known
