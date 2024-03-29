class UserSessionsController < ApplicationController
  before_filter :navegadorie6
  layout "admin"
  
  def new
    @user_session = UserSession.new
  end
 
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      if (User.find(@user_session.user).has_role? :admin)
        @admin = true
      end
    else
      @admin = false
      flash[:error] = "Usuário e/ou senha inválidos!"
    end
  end
 
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Sessão finalizada com sucesso."
    redirect_to root_url
  end
end
