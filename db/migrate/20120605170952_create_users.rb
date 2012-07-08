class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.boolean :status
      t.timestamp :created_at
      t.timestamp :updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
