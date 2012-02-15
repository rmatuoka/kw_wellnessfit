class Admin::SectorFunctionariesController < ApplicationController
  layout "inadmin"
  access_control do
      allow :admin 
      allow :supervisor, :empresario, :to =>[:show]
  end
  before_filter :permission_check, :load_functionary
  
  def index
    @sector_functionaries = @functionary.sector_functionaries.all
  end

  def show
    @sector_functionary = @functionary.sector_functionaries.find(params[:id])
  end

  def new
    @sector_functionary = @functionary.sector_functionaries.build
    @sectors = @company.sectors.all_active
  end

  def create
    @sector_functionary = @functionary.sector_functionaries.build(params[:sector_functionary])
    if @sector_functionary.save
      redirect_to admin_company_functionary_sector_functionary_path(@company, @functionary, @sector_functionary), :notice => "Successfully created sector functionary."
    else
      render :action => 'new'
    end
  end

  def edit
    @sector_functionary = @functionary.sector_functionaries.find(params[:id])
    @sectors = @company.sectors.all_active
  end

  def update
    @sector_functionary = @functionary.sector_functionaries.find(params[:id])
    if @sector_functionary.update_attributes(params[:sector_functionary])
      redirect_to admin_company_functionary_sector_functionary_path(@company, @functionary, @sector_functionary), :notice  => "Successfully updated sector functionary."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @sector_functionary = @functionary.sector_functionaries.find(params[:id])
    @sector_functionary.destroy
    redirect_to admin_company_functionary_sector_functionaries_path(@company, @functionary), :notice => "Successfully destroyed sector functionary."
  end

  def load_functionary
    @company = Company.find(params[:company_id])
    @functionary = @company.functionaries.find(params[:functionary_id])
  end  
end
