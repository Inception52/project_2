class PbuyersController < ApplicationController
  before_action :set_pbuyer, only: [:show, :edit, :update, :destroy]

  # GET /pbuyers
  # GET /pbuyers.json
  def index
    @pbuyers = Pbuyer.where("user_id = ?", session[:user_id]).all
  end

  # GET /pbuyers/1
  # GET /pbuyers/1.json
  def show
  end

  # GET /pbuyers/new
  def new
    @pbuyer = Pbuyer.new
  end

  # GET /pbuyers/1/edit
  def edit
  end

  # POST /pbuyers
  # POST /pbuyers.json
  def create
    @pbuyer = Pbuyer.new(pbuyer_params)


    respond_to do |format|
      if @pbuyer.save
        format.html { redirect_to pbuyers_path, notice: 'house was successfully added.' }
        format.json { render :index, status: :created, location: @pbuyer }
      else
        format.html { redirect_to pbuyers_path, notice: 'It was not added successfully.'}
        format.json { render json: @pbuyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pbuyers/1
  # PATCH/PUT /pbuyers/1.json
  def update
    respond_to do |format|
      if @pbuyer.update(pbuyer_params)
        format.html { redirect_to @pbuyer, notice: 'Pbuyer was successfully updated.' }
        format.json { render :show, status: :ok, location: @pbuyer }
      else
        format.html { render :edit }
        format.json { render json: @pbuyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pbuyers/1
  # DELETE /pbuyers/1.json
  def destroy
    @pbuyer.destroy
    respond_to do |format|
      format.html { redirect_to pbuyers_url, notice: 'Pbuyer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pbuyer
      @pbuyer = Pbuyer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pbuyer_params
      params.permit(:house_id, :user_id)
    end
end
