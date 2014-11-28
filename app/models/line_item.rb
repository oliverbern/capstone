class LineItem < ActiveRecord::Base
  belongs_to :colorgem
  belongs_to :colordiamonds
  belongs_to :diamonds
  belongs_to :jewellery
  belongs_to :cart
end
