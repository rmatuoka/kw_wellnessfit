class Admin::EventsController < ApplicationController
  layout "inadmin"
  access_control do
      allow :admin 
      allow :supervisor, :empresario, :to =>[:show]
  end
  before_filter :permission_check, :load_company
  
  def index
    @events = @company.events.all(:order=>"event_date")
  end

  def show
    @event = @company.events.find(params[:id])
  end

  def new
    @event = @company.events.build
    @turnos = @company.bouts.all
  end

  def create
    @event = @company.events.build(params[:event])
    if @event.save
      redirect_to admin_company_event_path(@company,@event), :notice => "Successfully created event."
    else
      render :action => 'new'
    end
  end

  def edit
    @event = @company.events.find(params[:id])
    @turnos = @company.bouts.all
  end

  def update
    @event = @company.events.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to admin_company_event_path(@company, @event), :notice  => "Successfully updated event."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event = @company.events.find(params[:id])
    @event.destroy
    redirect_to admin_company_events_path(@company), :notice => "Successfully destroyed event."
  end
  
  def load_company
    @company = Company.find(params[:company_id])
  end  
end
