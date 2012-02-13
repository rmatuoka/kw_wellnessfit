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
    @erro = true
    @presence = @event.presences.find(params[:id])
    @id = @presence.id
    if @presence.destroy
      @erro = false
    end
    #redirect_to admin_presences_url, :notice => "Successfully destroyed presence."
  end
  
  def load_event
    @company = Company.find(params[:company_id])
    @event = Event.find(params[:event_id])
  end
  
  def update_presences
    @erro = true
    if !params[:sigla].blank?
        @presence = @event.presences.find(params[:id])
        @presence.status_presence_id = params[:sigla] 
        if @presence.save
          @erro = false
          @status_presences = StatusPresence.all_unblock
          @out = ""
          @status_presences.each do |s|
      			 if @presence.status_presence_id == s.id
      				 @out += "<td align=\"center\" class=\"th_selected\">#{s.abbreviation}</td>"
      			 else 
      				 @out += "<td align=\"center\"><a href=\"/admin/companies/#{@company.id}/events/#{@event.id}/presences/#{@presence.id}/update_presences?sigla=#{s.id.to_s}\" data-remote=\"true\">#{s.abbreviation}</a></td>"
      			 end 
      		end
      		@out += "<td align=\"center\"><a href=\"/admin/companies/#{@company.id}/events/#{@event.id}/presences/#{@presence.id}\" data-confirm='Esta operação não poderá ser desfeita, deseja continuar?' data-method=\"delete\" data-remote=\"true\" rel=\"nofollow\">Não Participa!</a> </td>"
      		puts @out
        end
    end
  end
end
