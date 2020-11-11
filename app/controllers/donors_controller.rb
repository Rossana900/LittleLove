class DonorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_donor, only: [:show, :edit, :update, :destroy]
  layout 'donor_layout'


  # GET /donor
  # GET /donors.json
  def index
    @donors = Donor.all
  end

  # GET /donors/1
  # GET /donors/1.json
  def show
  end

  # GET /donors/new
  def new
    @donor = Donor.new
  end

  # GET /donors/1/edit
  def edit
  end

  # POST /donors
  # POST /donors.json
  def create
    @donor = Donor.new(donor_params)
    if @donor.save
      flash.notice = "The donor record was created successfully."
      redirect_to donations_path
    else
      flash.now.alert = @donor.errors.full_messages.to_sentence
      render :new  
    end
  end



    # @donor = Donor.new(donor_params)

    # respond_to do |format|
    #   if @donor.save
    #     format.html { redirect_to @donor, notice: 'Donor was successfully created.' }
    #     format.json { render :show, status: :created, location: @donor }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @donor.errors, status: :unprocessable_entity }
    #   end
    # end
  

  # PATCH/PUT /donors/1
  # PATCH/PUT /donors/1.json
  def update
    if @donor.update(donor_params)
      flash.notice = "The donor record was updated successfully."
      redirect_to @donor
    else
      flash.now.alert = @donor.errors.full_messages.to_sentence
      render :edit
    end
  end


    # respond_to do |format|
    #   if @donor.update(donor_params)
    #     format.html { redirect_to @donor, notice: 'Donor was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @donor }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @donor.errors, status: :unprocessable_entity }
    #   end
    # end
  

  # DELETE /donors/1
  # DELETE /donors/1.json
  def destroy
    @donor.destroy
    respond_to do |format|
      format.html { redirect_to donors_url, notice: 'Donor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donor
      @donor = Donor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def donor_params
      params.require(:donor).permit(:first_name, :last_name, :phone, :email)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to donors_path
    end

end
