require 'test_helper'

class PartnershipDeedsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => PartnershipDeed.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    PartnershipDeed.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    PartnershipDeed.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to partnership_deed_url(assigns(:partnership_deed))
  end

  def test_edit
    get :edit, :id => PartnershipDeed.first
    assert_template 'edit'
  end

  def test_update_invalid
    PartnershipDeed.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PartnershipDeed.first
    assert_template 'edit'
  end

  def test_update_valid
    PartnershipDeed.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PartnershipDeed.first
    assert_redirected_to partnership_deed_url(assigns(:partnership_deed))
  end

  def test_destroy
    partnership_deed = PartnershipDeed.first
    delete :destroy, :id => partnership_deed
    assert_redirected_to partnership_deeds_url
    assert !PartnershipDeed.exists?(partnership_deed.id)
  end
end
