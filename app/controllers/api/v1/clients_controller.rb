class Api::V1::ClientsController < ApplicationController
  before_action :set_client, only: [:show, :update, :destroy]
  respond_to :json

  # GET /clients
  def index
    respond_with Client.all
  end

  # GET /clients/1
  def show
    respond_with @client
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      respond_with @client, status: :created, location: [:api, :v1, @client]
    else
      render json: { errors: @client.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      respond_with @client, status: :ok, location: [:api, :v1, @client]
    else
      render json: { errors: @client.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def client_params
    params.require(:client).permit(:name)
  end
end
