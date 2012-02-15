require 'test_helper'

class Admin::BoutFunctionariesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => BoutFunctionary.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    BoutFunctionary.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    BoutFunctionary.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_bout_functionary_url(assigns(:bout_functionary))
  end

  def test_edit
    get :edit, :id => BoutFunctionary.first
    assert_template 'edit'
  end

  def test_update_invalid
    BoutFunctionary.any_instance.stubs(:valid?).returns(false)
    put :update, :id => BoutFunctionary.first
    assert_template 'edit'
  end

  def test_update_valid
    BoutFunctionary.any_instance.stubs(:valid?).returns(true)
    put :update, :id => BoutFunctionary.first
    assert_redirected_to admin_bout_functionary_url(assigns(:bout_functionary))
  end

  def test_destroy
    bout_functionary = BoutFunctionary.first
    delete :destroy, :id => bout_functionary
    assert_redirected_to admin_bout_functionaries_url
    assert !BoutFunctionary.exists?(bout_functionary.id)
  end
end
