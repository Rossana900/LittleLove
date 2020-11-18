class DonorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_donor, only: [:show, :edit, :update, :destroy]
  layout 'donor_layout'


  def index
    @donors = Donor.all
  end

  def show
  end

  def new
    @donor = Donor.new
  end

  def edit
  end

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
    
  def update
    if @donor.update(donor_params)
      flash.notice = "The donor record was updated successfully."
      redirect_to @donor
    else
      flash.now.alert = @donor.errors.full_messages.to_sentence
      render :edit
    end
  end

 
  def destroy
    @donor.destroy
    respond_to do |format|
      format.html { redirect_to donors_url, notice: 'Donor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_donor
      @donor = Donor.find(params[:id])
    end

    def donor_params
      params.require(:donor).permit(:first_name, :last_name, :phone, :email)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to donors_path
    end
end
