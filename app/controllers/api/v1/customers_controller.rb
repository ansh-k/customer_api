class Api::V1::CustomersController < ApplicationController
  include CustomerFilter
  before_action :authorize_request, except: [:create]

  # GET /api/v1/customers
  def index
    @customers = CustomerFilter.results(params)

    render json: @customers
  end

  # GET /api/v1/customers/1
  def show
    render json: @customer
  end

  # POST /api/v1/customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/customers/1
  def destroy
    customer = Customer.find(params[:id])
    if customer.destroy
      render json: { message: "Customer deleted successfully" }, status: :ok
    else
      render json: customer.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def customer_params
      params.require(:customer).permit(:name, :address_id)
    end
end
