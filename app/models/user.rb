class User < ActiveRecord::Base

  # Added by Koudoku.
  has_one :subscription


	acts_as_messageable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :colorgems
  has_many :diamonds
  has_many :colordiamonds
  has_many :jewelleries


  enum role: [:checkuser, :standarduser, :silveruser, :golduser, :admin, :privateuser]


  def mailboxer_email(object)
  	return email
  end

  def name
  	email
  end
    
  def create_customer(options)
    options.stringify_keys!
    options['email'] = email
    if stripeid.blank?
        customer = Stripe::Customer.create(options)
        update_attribute(:stripeid, customer.id)
        return customer
    end
  end

end
