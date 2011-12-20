require 'test_helper'

class Admin::PresencesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Presence.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Presence.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Presence.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_presence_url(assigns(:presence))
  end

  def test_edit
    get :edit, :id => Presence.first
    assert_template 'edit'
  end

  def test_update_invalid
    Presence.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Presence.first
    assert_template 'edit'
  end

  def test_update_valid
    Presence.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Presence.first
    assert_redirected_to admin_presence_url(assigns(:presence))
  end

  def test_destroy
    presence = Presence.first
    delete :destroy, :id => presence
    assert_redirected_to admin_presences_url
    assert !Presence.exists?(presence.id)
  end
end
