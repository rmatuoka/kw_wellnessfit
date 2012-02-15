class Admin::FunctionariesController < ApplicationController
  layout "inadmin"
  access_control do
      allow :admin 
      allow :supervisor, :empresario, :to =>[:show]
  end
  before_filter :permission_check, :load_company
  
  def index
    @functionaries = @company.functionaries.all
  end

  def show
    @functionary = @company.functionaries.find(params[:id])
    @bout = @functionary.bout_functionaries.boutnow
    @sector = @functionary.sector_functionaries.sectornow
  end

  def new
    @functionary = @company.functionaries.build(:active => true)
    @setores = @company.sectors.all
  end

  def create
    @functionary = @company.functionaries.build(params[:functionary])
    if @functionary.save
      redirect_to admin_company_functionary_path(@company, @functionary), :notice => "Successfully created functionary."
    else
      render :action => 'new'
    end
  end

  def edit
    @functionary = @company.functionaries.find(params[:id])
    @setores = @company.sectors.all
  end

  def update
    @functionary = @company.functionaries.find(params[:id])
    if @functionary.update_attributes(params[:functionary])
      redirect_to admin_company_functionary_path(@company, @functionary), :notice  => "Successfully updated functionary."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @functionary = @company.functionaries.find(params[:id])
    @functionary.destroy
    redirect_to admin_company_functionaries_path(@company), :notice => "Successfully destroyed functionary."
  end
  
  def load_company
    @company = Company.find(params[:company_id])
  end
end
