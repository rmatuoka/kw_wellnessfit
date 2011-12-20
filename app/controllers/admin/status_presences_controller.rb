class Admin::StatusPresencesController < ApplicationController
  layout "inadmin"
  access_control do
      allow :admin 
      allow :supervisor, :empresario, :to =>[:show]
  end
  before_filter :permission_check, :check_status
  
  def index
    @status_presences = StatusPresence.all_unblock
  end

  def show
    @status_presence = StatusPresence.find(params[:id])
    
  end

  def new
    @status_presence = StatusPresence.new
  end

  def create
    @status_presence = StatusPresence.new(params[:status_presence])
    if @status_presence.save
      redirect_to [:admin, @status_presence], :notice => "Successfully created status presence."
    else
      render :action => 'new'
    end
  end

  def edit
    @status_presence = StatusPresence.find(params[:id])
  end

  def update
    @status_presence = StatusPresence.find(params[:id])
    if @status_presence.update_attributes(params[:status_presence])
      redirect_to [:admin, @status_presence], :notice  => "Successfully updated status presence."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @status_presence = StatusPresence.find(params[:id])
    @status_presence.destroy
    redirect_to admin_status_presences_url, :notice => "Successfully destroyed status presence."
  end
  
  def check_status
    redirect_to admin_status_presences_path if params[:id].to_i == STATUS_PRESENCA_PADRAO 
  end
end
