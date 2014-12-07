Koudoku.setup do |config|
  config.webhooks_api_key = "d51ca8c1-3aa1-4376-a8ec-504c61117119"
  config.subscriptions_owned_by = :user
  config.stripe_publishable_key = ENV['STRIPE_PUBLISHABLE_KEY']
  config.stripe_secret_key = ENV['STRIPE_SECRET_KEY']
  # config.free_trial_length = 30
end
