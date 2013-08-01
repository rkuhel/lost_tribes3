class User < ActiveRecord::Base
  ROLES = %w[admin vendor customer]

  attr_accessible :role

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates_presence_of :name
  
  before_create :validate_vendor

  private

  def validate_vendor
    if self.role == 'vendor'
      return ( !street_address1.blank? && !city.blank? && !state.blank? )
      # return !city.blank?
    end
    true
  end
end
