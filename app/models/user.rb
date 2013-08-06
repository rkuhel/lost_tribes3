class User < ActiveRecord::Base
  ROLES = %w[admin vendor customer guest]

  attr_accessible :role, :name, :email, :zip_code, :phone, :street_address1, :street_address2, :city, :state, :admin, :password, :password_confirmation

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates_presence_of :name
  validates_presence_of :phone, if: Proc.new {|user| user.role == 'vendor'}
  validates_presence_of :street_address1, if: Proc.new{|user| user.role == 'vendor'}
  validates_presence_of :city, if: Proc.new {|user| user.role == 'vendor'}
  validates_presence_of :state, if: Proc.new {|user| user.role == 'vendor'}
  validates_presence_of :zip_code, if: Proc.new {|user| user.role == 'vendor'}

  has_and_belongs_to_many :events
  has_many :created_events, foreign_key: 'creator_id', class_name: "Event", inverse_of: :creator
  has_many :carts, dependent: :destroy
  
  after_create :make_cart

  def make_cart
    self.carts << Cart.new(current: true)
  end

  def current_cart
    self.carts.find_by_current(true)
  end
end
