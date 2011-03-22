class CreateGits < ActiveRecord::Migration
  def self.up
    create_table :gits do |t|
      t.string :repository_url
      t.string :clone_url
      t.string :name
      t.text :public_key
      t.text :private_key

      t.timestamps
    end
  end

  def self.down
    drop_table :gits
  end
end
