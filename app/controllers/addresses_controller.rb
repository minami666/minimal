class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render new_address_path
    end

  end

  def edit
  end

  def update
  end

  private
    def address_params
      params.require(:address).permit(:postcode,:prefecture_code,:address_city,:address_street,:address_building).merge(user_id: current_user.id)
    end

end
