class HousesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def index
    @houses = House.all
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
	if(current_user.hunter? && current_user.realtor?)
		if(current_user.switch?)
			ifInterest = Pbuyer.where("house_id = ? AND user_id = ? ", @house.id, session[:user_id]).all
			if(ifInterest.length > 0)
			  @interest = 1
			else
			  @interest = 0
			end
		end
	end
	if(current_user.hunter? && !(current_user.realtor?))
		ifInterest = Pbuyer.where("house_id = ? AND user_id = ? ", @house.id, session[:user_id]).all
		if(ifInterest.length > 0)
			@interest = 1
		else
			@interest = 0
		end
	end		
	
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def find

  end

  def search
    plow = 0
    phigh = house.maximum("price")
    slow = 0
    shigh = house.maximum("square_footage")
    location = ""
    psql = ""
    ssql = ""


    plow1 = find_params[:plow]
    phigh1 = find_params[:phigh]
    slow1 = find_params[:slow]
    shigh1 = find_params[:shigh]
    location1 = find_params[:location]

    if(plow1!="")
      if(plow1 =~ /^[0-9]+([.]{1}[0-9]+){0,1}$/)
          plow = plow1
        else
        flash.now[:danger] = "Invalid low price, please enter a number bigger than 0"
        render 'find'
        return
      end
    end

    if(phigh1!="")
      if(phigh1 =~ /^[0-9]+([.]{1}[0-9]+){0,1}$/)
        phigh = phigh1
      else
        flash.now[:danger] = "Invalid high price, please enter a number bigger than 0"
        render 'find'
        return
      end
    end

    if(slow1!="")
      if(slow1 =~ /^[0-9]+([.]{1}[0-9]+){0,1}$/)
        slow = slow1
      else
        flash.now[:danger] = "Invalid low square footage, please enter a number bigger than 0"
        render 'find'
        return
      end
    end

    if(shigh1!="")
      if(shigh1 =~ /^[0-9]+([.]{1}[0-9]+){0,1}$/)
        shigh = shigh1
      else
        flash.now[:danger] = "Invalid high square footage, please enter a number bigger than 0"
        render 'find'
        return
      end
    end

    if(location1!="")
      if(location1 =~ /^[0-9a-zA-Z]+$/)
        location = location1
      else
        flash.now[:danger] = "Invalid location, please enter a valid location"
        render 'find'
        return
      end
    end

    if(location!="")
    @shouses = house.where("price BETWEEN ? AND ? AND square_footage BETWEEN ? AND ? AND location like ?", plow, phigh,slow,shigh,location).all
    else
      @shouses = house.where("price BETWEEN ? AND ? AND square_footage BETWEEN ? AND ? ", plow, phigh,slow,shigh).all
    end

    @a = slow
    @b = shigh
  end  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:company_id, :location, :square_footage, :year, :style, :price, :floors, :basement, :owner, :contact, :image)
    end

	def find_params
      params.permit(:plow, :phigh, :slow, :shigh, :location)
    end
	
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
