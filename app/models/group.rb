class Group < ActiveRecord::Base
	belongs_to :git
	has_and_belongs_to_many :users
	has_and_belongs_to_many :repositories
	def short_name
	return name
	end
end
