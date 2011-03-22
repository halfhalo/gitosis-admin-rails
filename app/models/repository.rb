class Repository < ActiveRecord::Base
	belongs_to :git
	has_and_belongs_to_many :users
	has_and_belongs_to_many :groups
	def short_name
		return name
	end
end
