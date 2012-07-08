require 'test_helper'

class PartnershipDeedTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PartnershipDeed.new.valid?
  end
end
