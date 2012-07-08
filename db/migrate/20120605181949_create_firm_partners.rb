class CreateFirmPartners < ActiveRecord::Migration
 
  def change
    create_table :firm_partners do |t|
      t.string :first_name
      t.string :last_name
      t.timestamp :date_of_joining
      t.string :address1
      t.string :address2
      t.integer :partnership_deed_id
      t.boolean :status
      t.integer :age
      t.string  :father_name
      t.timestamp :created_at
      t.timestamp :updated_at
      t.string  :religion
      t.timestamps
    end
  end
end
