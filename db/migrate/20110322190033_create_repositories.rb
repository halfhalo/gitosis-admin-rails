class CreateRepositories < ActiveRecord::Migration
  def self.up
    create_table :repositories do |t|
      t.integer :git_id
      t.string :name
      t.string :description
      t.integer :owner
      t.integer :visibility_level
      t.boolean :gitweb

      t.timestamps
    end
  end

  def self.down
    drop_table :repositories
  end
end
