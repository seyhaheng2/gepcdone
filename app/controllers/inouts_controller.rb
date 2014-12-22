class InoutsController < ApplicationController
  before_action :set_inout, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @inouts = Inout.all
    respond_with(@inouts)
  end

  def show
    respond_with(@inout)
  end

  def new
    @inout = Inout.new
    respond_with(@inout)
  end

  def edit
  end

  def create
    @inout = Inout.new(inout_params)
    @inout.save
    respond_with(@inout)
  end

  def update
    @inout.update(inout_params)
    respond_with(@inout)
  end

  def destroy
    @inout.destroy
    respond_with(@inout)
  end

  private
    def set_inout
      @inout = Inout.find(params[:id])
    end

    def inout_params
      params.require(:inout).permit(:name)
    end
end
