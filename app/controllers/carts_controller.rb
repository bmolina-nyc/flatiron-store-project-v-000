class CartsController < ApplicationController


  def show 

    @current_cart = Cart.find_by(id: params[:id])
  end

  def checkout

    @current_cart = Cart.find_by(id: params[:id])
    
    @current_cart.items.each do |item|
      item.inventory = (item.inventory - 1) 
      item.save
    end
    @current_cart.items.clear
    @current_cart.save

    redirect_to cart_path(@current_cart)
  end
end
