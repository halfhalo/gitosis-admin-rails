class User < ActiveRecord::Base
	has_many :key_pairs
	has_and_belongs_to_many :repositories
	has_and_belongs_to_many :groups
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
	def key_names
	end
	def display_name
	end
end
