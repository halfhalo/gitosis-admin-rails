class CreateRepositories < ActiveRecord::Migration
  def self.up
    create_table :repositories do |t|
      t.string :name
      t.string :description
      t.integer :visibility
      t.boolean :daemon
      t.boolean :gitweb
      t.string :owner

      t.timestamps
    end
  end

  def self.down
    drop_table :repositories
  end
end
