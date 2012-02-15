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
    @insertevents = true
  end

  def create
    @event = @company.events.build(params[:event])
    if @event.save
      #IMPORTA OS FUNCIONARIOS PARA O MODEL PRESENCE
      @sectors = @event.sectors.all
      @present_functionaries = BoutFunctionary.find(:all,
  												    :select=> "`bout_functionaries`.`functionary_id`, `sector_functionaries`.`functionary_id`, `sector_functionaries`.`sector_id`",
  												    :joins=>"INNER JOIN `sector_functionaries` ON `bout_functionaries`.`functionary_id` = `sector_functionaries`.`functionary_id`" ,
  												    :conditions=>['`bout_functionaries`.`start_date` <= ?
                                            AND	((`bout_functionaries`.`end_date` >= ? ) OR `bout_functionaries`.`end_date` is null)
                                            AND `sector_functionaries`.`start_date` <= ?
                                            AND	((`sector_functionaries`.`end_date` >= ? ) OR `sector_functionaries`.`end_date` is null)
                                            AND `bout_functionaries`.`bout_id` = ?
                                            AND `sector_functionaries`.`sector_id` IN (?)' , @event.event_date,@event.event_date,@event.event_date,@event.event_date,@event.bout_id,@sectors.each]
                              )
      @present_functionaries.each do |f|
        @presence = Presence.new
        @presence.functionary_id = f.functionary_id
        @presence.sector_id = f.sector_id
        @presence.event_id = @event.id
        @presence.status_presence_id = STATUS_PRESENCA_PADRAO       
        @presence.save        
      end
    #FIM IMPORTACAO
      
      redirect_to admin_company_event_presences_path(@company,@event), :notice => "Successfully created event."
    else
      render :action => 'new'
    end
  end

  def edit
    @event = @company.events.find(params[:id])
    @turnos = @company.bouts.all_active
    @sectors = @company.sectors.all_active
    @insertevents = false
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
