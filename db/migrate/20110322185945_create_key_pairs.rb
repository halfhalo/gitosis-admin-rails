class CreateKeyPairs < ActiveRecord::Migration
  def self.up
    create_table :key_pairs do |t|
      t.integer :user_id
      t.string :type
      t.text :public_key
      t.text :private_key

      t.timestamps
    end
  end

  def self.down
    drop_table :key_pairs
  end
end
