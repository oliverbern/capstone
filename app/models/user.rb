class User < ActiveRecord::Base
	acts_as_messageable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :colorgems
  has_many :diamonds
  has_many :colordiamonds
  has_many :jewelleries


  enum role: [:checkuser, :standarduser, :silveruser, :golduser, :admin]


  def mailboxer_email(object)
  	return email
  end

  def name
  	email
  end


end
