class AddressesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def edit
    @address = current_user.address
  end

  def update
    if current_user.address.update(address_params)
      redirect_to controller: :user, action: :show
    else
      render :edit
    end
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
  end
end
