class AddStatusRenewalReceptNoinPartnershipDeed < ActiveRecord::Migration
  def up
    add_column :partnership_deeds , :status ,:string
    add_column :partnership_deeds, :renewal_receipt_no , :string
    add_column :partnership_deeds, :dissolved_date , :timestamp
   
  end

  def down
  end
end
