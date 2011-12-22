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
    @turnos = @company.bouts.all_active
    @sectors = @company.sectors.all_active
  end

  def create
    @event = @company.events.build(params[:event])
    if @event.save
      #IMPORTA OS FUNCIONARIOS PARA O MODEL PRESENCE
      @sectors = @event.sectors.all
      
      @sectors.each do |s|
        s.functionaries.all.each do |f|
          @presence = Presence.new
          @presence.functionary_id = f.id
          @presence.event_id = @event.id
          @presence.status_presence_id = STATUS_PRESENCA_PADRAO
          
          @presence.save
        end
      end
      #FIM IMPORTACAO
      
      redirect_to admin_company_event_path(@company,@event), :notice => "Successfully created event."
    else
      render :action => 'new'
    end
  end

  def edit
    @event = @company.events.find(params[:id])
    @turnos = @company.bouts.all_active
    @sectors = @company.sectors.all_active
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
