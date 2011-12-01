class RssReader
  require 'rss'
  require 'open-uri'
  def self.posts_for(feed_url, length = 0, perform_validation=false, v_fonte = "")
    posts = []
    open(feed_url) do |rss|
      posts = RSS::Parser.parse(rss, perform_validation).items
    end
    if length > 0
      posts[0..length - 1] if posts.size > length
    else
      posts[0..length - 1]
    end
    
  end
end
class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  helper_method :current_user
  
  def navegadorie6
    if browser.ie6?
      redirect_to atualizar_index_path
    end 
  end
     
  private
  
  def permission_check
    if User.find(current_user.id).has_role? :empresario
      @mcompanies = Company.all
    else
      @mcompanies = Company.all
    end
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
   
  rescue_from 'Acl9::AccessDenied', :with => :access_denied
   
  def access_denied
    if current_user
      flash[:temerro] = " "
      flash[:error] = 'Você não tem permissão para acessar está página!'
      redirect_to login_path       
    else
      flash[:temerro] = " "
      flash[:error] = 'Acesso negado. Você precisa estar logado.'
      redirect_to login_path
    end
  end

end
