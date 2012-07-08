class CreatePartnershipDeeds < ActiveRecord::Migration
  def self.up
    create_table :partnership_deeds do |t|
 
      t.integer :user_id
      t.string :firm_name
      t.string :firm_address
      t.string :firm_address1
      t.string :registration_number
      t.string :filled_by
      t.timestamp :duration
      t.timestamp :created_at
      t.timestamp :updated_at
      t.timestamp :next_renewal_date
      t.timestamp :date_of_registration
      t.timestamps
    end
  end

  def self.down
    drop_table :partnership_deeds
  end
end
