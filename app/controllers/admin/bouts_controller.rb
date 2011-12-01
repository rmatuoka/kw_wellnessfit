class Admin::BoutsController < ApplicationController
  layout "inadmin"
  access_control do
      allow :admin 
      allow :supervisor, :empresario, :to =>[:show]
  end
  before_filter :permission_check  
  
  def index
    @bouts = Bout.all
  end

  def show
    @bout = Bout.find(params[:id])
  end

  def new
    @bout = Bout.new
  end

  def create
    @bout = Bout.new(params[:bout])
    if @bout.save
      redirect_to [:admin, @bout], :notice => "Successfully created bout."
    else
      render :action => 'new'
    end
  end

  def edit
    @bout = Bout.find(params[:id])
  end

  def update
    @bout = Bout.find(params[:id])
    if @bout.update_attributes(params[:bout])
      redirect_to [:admin, @bout], :notice  => "Successfully updated bout."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @bout = Bout.find(params[:id])
    @bout.destroy
    redirect_to admin_bouts_url, :notice => "Successfully destroyed bout."
  end
end
