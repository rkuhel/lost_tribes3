class User < ActiveRecord::Base
  ROLES = %w[admin vendor customer]

  attr_accessible :role, :name, :email, :zip_code, :phone, :street_address1, :street_address2, :city, :state, :admin, :password

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  validates_presence_of :name

  has_and_belongs_to_many :events
  has_many :created_events, foreign_key: 'creator_id', class_name: "Event", inverse_of: :creator
  has_many :carts, dependent: :destroy
  
  before_create :validate_vendor #if self.role == 'vendor
  after_create :make_cart

  def make_cart
    self.carts << Cart.new(current: true)
  end

  def current_cart
    self.carts.find_by_current(true)  
  end

  private

  def validate_vendor
    if self.role == 'vendor'
      return ( !street_address1.blank? && !city.blank? && !state.blank? && !phone.blank? && !zip_code.blank? )
    end
    true
  end

end
