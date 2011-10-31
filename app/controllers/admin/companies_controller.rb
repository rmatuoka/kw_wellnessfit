class Admin::CompaniesController < ApplicationController
  layout "inadmin"

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to [:admin, @company], :notice => "Successfully created company."
    else
      render :action => 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      redirect_to [:admin, @company], :notice  => "Successfully updated company."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to admin_companies_url, :notice => "Successfully destroyed company."
  end
end
