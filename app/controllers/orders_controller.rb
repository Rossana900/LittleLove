class OrdersController < ApplicationController
    def index
        @orders = Order.all
    end 
    
    def new
        @order = Order.new
    end       

    def create
        # @customer = Customer.find(params["customer_id"])
        # require "pry"
        # binding.pry 
        # @order = Order.create(params["order"])
        @order = Order.create(order_params) 
        unless @order.errors.any? 
            flash.notice = "The order record was created successfully."      
            redirect_to orders_path
        else   
            flash.now.alert = @order.errors.full_messages.to_sentence
            render :new
        end    
    end 

    def show
        @order = Order.find(params["id"])
    end    

    def edit
        @order = Order.find(params["id"])
        @customers = Customer.all
    end   
    
    def update
        @order = Order.find(params["id"])
        if @order.update(order_params)
          flash.notice = "The order record was updated successfully."
          redirect_to @order
        else
          flash.now.alert = @order.errors.full_messages.to_sentence
          render :edit
        end
    end 
    
    def destroy
        @order = Order.find(params["id"])
        @order.destroy
        respond_to do |format|
            format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
            format.json { head :no_content }
        end
    end 
    
    private
    def order_params
        params.require(:order).permit(:product_name, :product_count, :customer_id)
    end    
end    