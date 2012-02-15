class Admin::BoutFunctionariesController < ApplicationController
  layout "inadmin"
  access_control do
      allow :admin 
      allow :supervisor, :empresario, :to =>[:show]
  end
  before_filter :permission_check,  :load_functionary  
  
  def index
    @bout_functionaries = @functionary.bout_functionaries.all
  end

  def show
    @bout_functionary = @functionary.bout_functionaries.find(params[:id])
  end

  def new
    @bout_functionary = @functionary.bout_functionaries.build
    @turnos = @company.bouts.all_active
  end

  def create
    @bout_functionary = @functionary.bout_functionaries.build(params[:bout_functionary])
    if @bout_functionary.save
      redirect_to admin_company_functionary_bout_functionary_path(@company,@functionary,@bout_functionary), :notice => "Successfully created bout functionary."
    else
      render :action => 'new'
    end
  end

  def edit
    @bout_functionary = @functionary.bout_functionaries.find(params[:id])
    @turnos = @company.bouts.all_active
  end

  def update
    @bout_functionary = @functionary.bout_functionaries.find(params[:id])
    if @bout_functionary.update_attributes(params[:bout_functionary])
      redirect_to admin_company_functionary_bout_functionary_path(@company,@functionary,@bout_functionary), :notice  => "Successfully updated bout functionary."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @bout_functionary = @functionary.bout_functionaries.find(params[:id])
    @bout_functionary.destroy
    redirect_to admin_company_functionary_bout_functionaries_path(@company,@functionary), :notice => "Successfully destroyed bout functionary."
  end
  
  def load_functionary
    @company = Company.find(params[:company_id])
    @functionary = @company.functionaries.find(params[:functionary_id])
  end
end
