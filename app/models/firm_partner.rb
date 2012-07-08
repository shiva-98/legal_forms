class FirmPartner < ActiveRecord::Base
  attr_accessible :address1,:address2, :created_at, :date_of_joining, :first_name, :last_name, :status, :updated_at, :partnership_deed_id, :age, :religion, :father_name
  belongs_to :partnership_deed
end
