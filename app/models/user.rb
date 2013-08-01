class User < ActiveRecord::Base

  attr_accessible :roles
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  ROLES = %w[admin vendor customer]

  # def roles=(roles)
  #   self.roles_mask

  # end
end
