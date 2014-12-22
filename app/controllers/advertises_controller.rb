class AdvertisesController < ApplicationController
  before_action :set_advertise, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @advertises = Advertise.all
    respond_with(@advertises)
  end

  def show
    respond_with(@advertise)
  end

  def new
    @advertise = Advertise.new
    respond_with(@advertise)
  end

  def edit
  end

  def create
    @advertise = Advertise.new(advertise_params)
    @advertise.save
    respond_with(@advertise)
  end

  def update
    @advertise.update(advertise_params)
    respond_with(@advertise)
  end

  def destroy
    @advertise.destroy
    respond_with(@advertise)
  end

  private
    def set_advertise
      @advertise = Advertise.find(params[:id])
    end

    def advertise_params
      params.require(:advertise).permit(:name, :text)
    end
end
