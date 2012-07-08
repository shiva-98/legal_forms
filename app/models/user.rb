class User < ActiveRecord::Base
  attr_accessible :name, :address, :phone_number, :status, :created_at, :updated_at
  has_many :partnership_deeds
end
