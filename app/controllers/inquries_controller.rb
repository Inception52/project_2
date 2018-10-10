class InquriesController < ApplicationController
  before_action :set_inqury, only: [:show, :edit, :update, :destroy]

  # GET /inquries
  # GET /inquries.json
  def index
    @pid = params[:pid]
    @inquries = Inqury.where("pbuyer_id = ?", @pid).all
    #@inquries = Inqury.all
  end

  # GET /inquries/1
  # GET /inquries/1.json
  def show
    @pid = params[:pid]
  end

  # GET /inquries/new
  def new
    @pid = params[:pid]
    @inqury = Inqury.new
  end

  # GET /inquries/1/edit
  def edit
    if (!(current_user.realtor?))
      @pid = params[:pid]
    end
  end

  # POST /inquries
  # POST /inquries.json
  def create
    @pid = inqury_params[:pbuyer_id]
    @inqury = Inqury.new(inqury_params)

    respond_to do |format|
      if @inqury.save
        format.html { redirect_to inqury_path(@inqury, :pid=>@pid), notice: 'Inqury was successfully created.' }
        format.json { render :show, status: :created, location: @inqury }
      else
        format.html { render :new }
        format.json { render json: @inqury.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inquries/1
  # PATCH/PUT /inquries/1.json
  def update
    if (!(current_user.realtor?))
      @pid = inqury_params[:pbuyer_id]
      respond_to do |format|
        if @inqury.update(inqury_params)
          format.html { redirect_to inqury_path(@inqury, :pid => @pid), notice: 'Inqury was successfully updated.' }
          format.json { render :show, status: :ok, location: @inqury }
        else
          format.html { render :edit }
          format.json { render json: @inqury.errors, status: :unprocessable_entity }
        end
      end
    end
    /**if (current_user.realtor?)
      @inqury = Inqury.find(params[:id])
      if @inqury.update_attributes(inqury_params)
        flash[:success] = "Profile updated"
        redirect_to @inqury
      else
        render 'edit'
      end
    end*/
  end

  # DELETE /inquries/1
  # DELETE /inquries/1.json
  def destroy
    @pid = params[:pid]
    @inqury.destroy
    respond_to do |format|
      format.html { redirect_to inquries_url(:pid => @pid), notice: 'Inqury was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inqury
      @inqury = Inqury.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inqury_params
      params.require(:inqury).permit(:subject, :content, :pbuyer_id)
    end
end
