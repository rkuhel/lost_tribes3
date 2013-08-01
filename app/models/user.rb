class User < ActiveRecord::Base
  ROLES = %w[admin vendor customer]

  attr_accessible :role

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  validates_presence_of :name
  
<<<<<<< HEAD
  before_create :validate_vendor #if self.role == 'vendor
  ROLES = %w[admin vendor customer]

  # def roles=(roles)
  #   self.roles_mask

  # end
=======
  before_create :validate_vendor
>>>>>>> 304fbd4cd401a1d86302a223520e391e807f4e66

  private

  def validate_vendor
    if self.role == 'vendor'
      return ( !street_address1.blank? && !city.blank? && !state.blank? && !phone.blank? && !zip_code.blank? )
      # return !city.blank?
    end
    true
  end
end
