class WorksController < ApplicationController
  def new
    
  end

  def index
    redirect_to works_new_path
  end

  def show 
    redirect_to works_new_path
  end

  def create
     ContactMailer.works(params[:name], params[:email], params[:phone],params[:anexado]).deliver
  end
end
