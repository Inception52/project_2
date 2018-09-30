class CompaniesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  
  def index
    @companies = Company.paginate(page: params[:page])
  end
  
  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(user_params)
    if @company.save
      flash[:success] = "establish successfully"
      redirect_to @company
    else
      render 'new'
    end
  end
  
  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      flash[:success] = "Profile updated"
      redirect_to @company
    else
      render 'edit'
    end
  end
  
  def destroy
    Company.find(params[:id]).destroy
    flash[:success] = "Company deleted"
    redirect_to company_url
  end
  
  private

    def company_params
      params.require(:company).permit(:Name, :Website, :Address,
                                   :Size, :Founded, :Revenue)
    end

    # Before filters
    
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
	store_location
        flash[:danger] = "Please log in."
	redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
