class Api::V1::AddressesController < ApplicationController

  # GET /api/v1/addresses
  def index
    @addresses = Address.all

    render json: @addresses
  end
end
