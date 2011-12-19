class Admin::BoutsController < ApplicationController
  layout "inadmin"
  access_control do
      allow :admin 
      allow :supervisor, :empresario, :to =>[:show]
  end
  before_filter :permission_check, :load_company  
  
  def index
    @bouts = @company.bouts.all
  end

  def show
    @bout = @company.bouts.find(params[:id])
  end

  def new
    @bout = @company.bouts.build(:active => true)
  end

  def create
    @bout = @company.bouts.build(params[:bout])
    if @bout.save
      redirect_to admin_company_bout_path(@company, @bout), :notice => "Successfully created bout."
    else
      render :action => 'new'
    end
  end

  def edit
    @bout = @company.bouts.find(params[:id])
  end

  def update
    @bout = @company.bouts.find(params[:id])
    if @bout.update_attributes(params[:bout])
      redirect_to admin_company_bout_path(@company, @bout), :notice  => "Successfully updated bout."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @bout = @company.bouts.find(params[:id])
    @bout.destroy
    redirect_to admin_company_bouts_path(@company), :notice => "Successfully destroyed bout."
  end
  def load_company
    @company = Company.find(params[:company_id])
  end
end
