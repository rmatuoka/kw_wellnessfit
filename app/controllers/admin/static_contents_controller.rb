class Admin::StaticContentsController < ApplicationController  
  access_control do
      allow :admin, :supervisor
  end
  before_filter :permission_check
  
  layout "inadmin"  
    
  def index
    
  end
end
