class CheckoutsController < ApplicationController
    def checkout
        # require "pry"
        # binding.pry 
    end    

    def purchase
    #   require "pry"
    #   binding.pry   

    @donor=Donor.find(params["donor"])
    

    @donations=@donor.donations.where(donations_donors: {purchased: false})
    # require "pry"
    # binding.pry 
    end    

    def donated
        @donor=Donor.find(params["id"])
        flash.notice = "Thank you #{@donor.full_name}, the donation was sent successfully."
        redirect_to donations_path
    end    
end


   