class User < ActiveRecord::Base
	belongs_to :git
	has_and_belongs_to_many :groups
	has_and_belongs_to_many :repositories
	has_many :key_pairs
	def key_name
		return user_name
	end
	def display_name
		return user_name
	end
end
