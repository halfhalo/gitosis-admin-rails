class Git < ActiveRecord::Base
	has_many :users
	has_many :repositories
	has_many :groups
	def write_gitosis
		@gitosis="[gitosis]\ngitweb = no\ndaemon = no"
		@gitosis+=""+build_repo_groups
		@gitosis+=""+build_group_lists
		@gitosis+=""+build_gitosis_repo
		

		return @gitosis
	end
	def build_repo_groups
		#this is where we make the gitosis-admin repo entry plus the single repo groups
		@output=""
		@output+="\n\n[group gitosis-admin]\nwriteable = gitosis-admin "
		@repo=""
		repositories.each do |repo|
			@output+=repo.short_name+" "
			@repo+="\n\n[group "+repo.short_name+"_gitosis_ag]"
			@repo+="\nwritable = "+repo.short_name
			if(repo.users.count>0)
				@repo+="\nmembers = "
				repo.users.each do |u|
					@repo+=u.key_name+" "
				end
			end
		end
		@output+="\nmembers = gitosis-key "
		users.each do |u|
			@output+=u.key_name+" "
		end
		@output+=""+@repo
			return @output || ""
	end
	def build_group_lists
		@output=""
		groups.each do |group|
			@output+="\n\n"
			@output+="[group "+group.short_name+"]"
			@user=""
			group.users.each do |user|
				if(@user.length>0)
					@user+=" "
				end
				@user+=user.key_names
			end
			if(@user.length>0)
				@output+="\nmembers = "+@user
			else
			end
			@repo=""
			group.repositories.each do |repo|
				if(@repo.length>0)
					@repo+=" "
				end
				@repo+=repo.short_name
			end
			if(@repo.length>0)
				@output+="\nwritable = "+@repo
			else
			end
		end
		if(@user.length>2)
		return @output || ""
	else
		return ""
	end
	end
	def build_gitosis_repo
		@output=""
		repositories.each do |repo|
			@repo="\n\n[repo "+repo.short_name+"]"
			@repo+="\nDescription = "+repo.description
			if(repo.owner!=nil && repo.owner!=0)
				@repo+="\nowner = "
				@repo+=repo.owner.to_s()
			else
				@repo+="\nowner = Gitosis"
			end
			@repo+="\ndaemon = "
			if(repo.visibility_level && repo.visibility_level>2)
				@repo+="yes"
			else
				@repo+="no"
			end
			if(repo.gitweb)
				@repo+="\ngitweb = yes"
			else
				@repo+="\ngitweb = no"
			end
			@output+=@repo
		end
		return @output
	end
	
	def get_gitosis_admin
		return ""
	end
end
