class Admin::SectorsController < ApplicationController
  layout "inadmin"
  access_control do
      allow :admin 
      allow :supervisor, :empresario, :to =>[:show]
  end
  before_filter :permission_check, :load_company
  
  def index
    @sectors = @company.sectors.all
  end

  def show
    @sector = @company.sectors.find(params[:id])
  end

  def new
    @sector = @company.sectors.build(:active => true)
  end

  def create
    @sector = @company.sectors.build(params[:sector])
    if @sector.save
      redirect_to admin_company_sector_path(@company, @sector), :notice => "Successfully created sector."
    else
      render :action => 'new'
    end
  end

  def edit
    @sector = @company.sectors.find(params[:id])
  end

  def update
    @sector = @company.sectors.find(params[:id])
    if @sector.update_attributes(params[:sector])
      redirect_to admin_company_sector_path(@company, @sector), :notice  => "Successfully updated sector."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @sector = @company.sectors.find(params[:id])
    @sector.destroy
    redirect_to admin_company_sectors_path(@company), :notice => "Successfully destroyed sector."
  end
  
  def load_company
    @company = Company.find(params[:company_id])
  end
end
