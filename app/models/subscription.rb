class Subscription < ActiveRecord::Base
  include Koudoku::Subscription

  belongs_to :user
  belongs_to :coupon

      Plan.create({
      name: 'Personal',
      price: 10.00,
      interval: 'month',
      stripe_id: '1',
      features: ['1 Project', '1 Page', '1 User', '1 Organization'].join("\n\n"),
      display_order: 1
    })

    Plan.create({
      name: 'Team',
      highlight: true, # This highlights the plan on the pricing page.
      price: 30.00,
      interval: 'month',
      stripe_id: '2',
      features: ['3 Projects', '3 Pages', '3 Users', '3 Organizations'].join("\n\n"),
      display_order: 2
    })

    Plan.create({
      name: 'Enterprise',
      price: 100.00, 
      interval: 'month',
      stripe_id: '3', 
      features: ['10 Projects', '10 Pages', '10 Users', '10 Organizations'].join("\n\n"), 
      display_order: 3
    })

end
