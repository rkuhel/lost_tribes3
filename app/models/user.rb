class User < ActiveRecord::Base

  attr_accessible :role
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  validates_presence_of :name
  
  before_create :validate_vendor #if self.role == 'vendor
  ROLES = %w[admin vendor customer]

  # def roles=(roles)
  #   self.roles_mask

  # end

  private 

  def validate_vendor
    if self.role == 'vendor'
      return !street_address1.blank?
    end

    true
  end
end
