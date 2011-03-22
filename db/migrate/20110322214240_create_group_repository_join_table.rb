class CreateGroupRepositoryJoinTable < ActiveRecord::Migration
  def self.up
    create_table :groups_repositories, :id => false do |t|
			t.integer :group_id
			t.integer :repository_id
		end
  end

  def self.down
		 drop_table :groups_repositories
  end
end
