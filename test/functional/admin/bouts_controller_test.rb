require 'test_helper'

class Admin::BoutsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Bout.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Bout.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Bout.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_bout_url(assigns(:bout))
  end

  def test_edit
    get :edit, :id => Bout.first
    assert_template 'edit'
  end

  def test_update_invalid
    Bout.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Bout.first
    assert_template 'edit'
  end

  def test_update_valid
    Bout.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Bout.first
    assert_redirected_to admin_bout_url(assigns(:bout))
  end

  def test_destroy
    bout = Bout.first
    delete :destroy, :id => bout
    assert_redirected_to admin_bouts_url
    assert !Bout.exists?(bout.id)
  end
end
