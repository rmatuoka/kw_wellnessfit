class Admin::PresencesController < ApplicationController
  layout "inadmin"
  access_control do
      allow :admin 
      allow :supervisor, :empresario, :to =>[:show, :information]
  end
  before_filter :permission_check, :load_event
  def index
    @presences = @event.presences.all
    @status_presences = StatusPresence.all_unblock
  end

  def show
    @presence = @event.presences.find(params[:id])
  end

  def new
    @presence = @event.presences.build
  end

  def create
    @presence = @event.presences.build(params[:presence])
    if @presence.save
      #redirect_to [:admin, @presence], :notice => "Successfully created presence."
    else
      render :action => 'new'
    end
  end

  def edit
    @presence = @event.presences.find(params[:id])
  end

  def update
    @presence = @event.presences.find(params[:id])
    if @presence.update_attributes(params[:presence])
      #redirect_to [:admin, @presence], :notice  => "Successfully updated presence."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @presence = @event.presences.find(params[:id])
    @presence.destroy
    #redirect_to admin_presences_url, :notice => "Successfully destroyed presence."
  end
  
  def load_event
    @company = Company.find(params[:company_id])
    @event = Event.find(params[:event_id])
  end
  
  def update_presences
    @sigla = params[:sigla]
  end
end
