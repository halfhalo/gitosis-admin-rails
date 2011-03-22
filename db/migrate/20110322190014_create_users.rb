class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :git_id
      t.string :user_name
      t.string :real_name
      t.string :email
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end