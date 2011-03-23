class Repository < ActiveRecord::Base
	belongs_to :git
	has_and_belongs_to_many :users
	has_and_belongs_to_many :groups
	def short_name
		return name.downcase.gsub(/\s/,"_")+"_"+id.to_s()
	end
	def push_user(user)
		@users=user_ids
		if(@users.include?(user.id))
			return false
		else
			return users.push(user)
		end
	end
	def pop_user(user)
		@users=user_ids
	end
end
