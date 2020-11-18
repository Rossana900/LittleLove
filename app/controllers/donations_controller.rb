class DonationsController < ApplicationController
    def index
        @donations = Donation.all
        # require "pry"
        # binding.pry 
    end 
    
    def new
        @donation = Donation.new
    end       

    def create
        @donation = Donation.create(donation_params) 
        unless @donation.errors.any? 
            flash.notice = "The donation record was created successfully."      
            redirect_to donations_path
        else   
            flash.now.alert = @donation.errors.full_messages.to_sentence
            render :new
        end    
    end 

    def show
        @donation = Donation.find(params["id"])
    end    

    def edit
        @donation = Donation.find(params["id"])
        @donors = Donor.all
    end   
    
    def update
        @donation = Donation.find(params["id"])
        @donor = Donor.find(params["donor"])
        dd=DonationsDonor.new(donor:@donor, donation:@donation, purchased: false, count: @donation.product_count+params['quantity'].to_i)
        if dd.save  
          flash.notice = "The donation record was updated successfully."
          redirect_to donations_path
        else
          flash.now.alert = @donation.errors.full_messages.to_sentence
          render :edit
        end
    end 
    
    def destroy
        @donation = Donation.find(params["id"])
        @donation.destroy
        respond_to do |format|
            format.html { redirect_to donations_url, notice: 'Donation was successfully destroyed.' }
            format.json { head :no_content }
        end
    end 
    
    private
    def donation_params
        params.require(:donation).permit(:product_name, :product_count, :customer_id)
    end    
end    