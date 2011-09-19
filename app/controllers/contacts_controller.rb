class ContactsController < ApplicationController
  def new
    
  end

  def index
    redirect_to contacts_new_path
  end

  def show
    redirect_to contacts_new_path
  end

  def create
     ContactMailer.enviar(params[:name], params[:email], params[:phone],params[:message]).deliver
  end

end
