class CheckoutsController < ApplicationController
    def checkout
        # require "pry"
        # binding.pry          
    end    

    def purchase
        @donor=Donor.find(params["donor"])
        @donations_donors= @donor.donations_donors
        @donations=@donor.donations.where(donations_donors: {purchased: false}) 
    end    

    def donated
        @donor=Donor.find(params["id"])
        # require "pry"
        # binding.pry 
        @donor.donations_donors.delete_all
        # DonationsDonor.joins(:donors).where(donations_donors: {donor_id:@donor.id}).delete_all
        flash.notice = "Thank you #{@donor.full_name}, the donation was sent successfully."
        redirect_to donations_path
    end    
end


   