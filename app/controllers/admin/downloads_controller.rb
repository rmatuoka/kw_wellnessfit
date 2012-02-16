class Admin::DownloadsController < ApplicationController
  layout "inadmin"
  access_control do
      allow :admin 
      allow :supervisor, :empresario, :to =>[:show]
  end
  before_filter :permission_check  
  def index
    @downloads = Download.all
  end

  def show
    @download = Download.find(params[:id])
  end

  def new
    @download = Download.new
  end

  def create
    @download = Download.new(params[:download])
    if @download.save
      redirect_to [:admin, @download], :notice => "Successfully created download."
    else
      render :action => 'new'
    end
  end

  def edit
    @download = Download.find(params[:id])
  end

  def update
    @download = Download.find(params[:id])
    if @download.update_attributes(params[:download])
      redirect_to [:admin, @download], :notice  => "Successfully updated download."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @download = Download.find(params[:id])
    @download.destroy
    redirect_to admin_downloads_url, :notice => "Successfully destroyed download."
  end
    def baixar
      @datafile = Download.find(params[:id])
      send_file(@datafile.archive.path,:disposition => 'inline')
    end 
end
