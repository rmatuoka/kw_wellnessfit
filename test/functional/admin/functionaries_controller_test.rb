require 'test_helper'

class Admin::FunctionariesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Functionary.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Functionary.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Functionary.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_functionary_url(assigns(:functionary))
  end

  def test_edit
    get :edit, :id => Functionary.first
    assert_template 'edit'
  end

  def test_update_invalid
    Functionary.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Functionary.first
    assert_template 'edit'
  end

  def test_update_valid
    Functionary.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Functionary.first
    assert_redirected_to admin_functionary_url(assigns(:functionary))
  end

  def test_destroy
    functionary = Functionary.first
    delete :destroy, :id => functionary
    assert_redirected_to admin_functionaries_url
    assert !Functionary.exists?(functionary.id)
  end
end
