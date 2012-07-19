class PartnershipDeed < ActiveRecord::Base
  attr_accessible :user_id,:firm_name, :firm_address,:firm_address1,:registration_number, :filled_by, :duration, :created_at, :updated_at, :firm_partners_attributes, :next_renewal_date,:date_of_registration,:dissolved_date,:renewal_receipt_no
  has_many :firm_partners
  belongs_to :user
  accepts_nested_attributes_for :firm_partners, :reject_if => :all_blank, :allow_destroy => true
end
