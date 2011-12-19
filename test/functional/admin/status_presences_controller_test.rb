require 'test_helper'

class Admin::StatusPresencesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => StatusPresence.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    StatusPresence.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    StatusPresence.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_status_presence_url(assigns(:status_presence))
  end

  def test_edit
    get :edit, :id => StatusPresence.first
    assert_template 'edit'
  end

  def test_update_invalid
    StatusPresence.any_instance.stubs(:valid?).returns(false)
    put :update, :id => StatusPresence.first
    assert_template 'edit'
  end

  def test_update_valid
    StatusPresence.any_instance.stubs(:valid?).returns(true)
    put :update, :id => StatusPresence.first
    assert_redirected_to admin_status_presence_url(assigns(:status_presence))
  end

  def test_destroy
    status_presence = StatusPresence.first
    delete :destroy, :id => status_presence
    assert_redirected_to admin_status_presences_url
    assert !StatusPresence.exists?(status_presence.id)
  end
end
