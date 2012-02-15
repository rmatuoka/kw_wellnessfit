require 'test_helper'

class Admin::SectorFunctionariesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => SectorFunctionary.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    SectorFunctionary.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    SectorFunctionary.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_sector_functionary_url(assigns(:sector_functionary))
  end

  def test_edit
    get :edit, :id => SectorFunctionary.first
    assert_template 'edit'
  end

  def test_update_invalid
    SectorFunctionary.any_instance.stubs(:valid?).returns(false)
    put :update, :id => SectorFunctionary.first
    assert_template 'edit'
  end

  def test_update_valid
    SectorFunctionary.any_instance.stubs(:valid?).returns(true)
    put :update, :id => SectorFunctionary.first
    assert_redirected_to admin_sector_functionary_url(assigns(:sector_functionary))
  end

  def test_destroy
    sector_functionary = SectorFunctionary.first
    delete :destroy, :id => sector_functionary
    assert_redirected_to admin_sector_functionaries_url
    assert !SectorFunctionary.exists?(sector_functionary.id)
  end
end
