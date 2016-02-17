class ParksController < ApplicationController

  def new
    @park = Park.new
  end

  def index
    # @parks = Park.all
    @search = Park.search(params[:q])
    @parks = @search.result(distinct: true)
  end

  def create
    @park = Park.new(park_params)

    if @park.save
      redirect_to park_path(@park), notice: 'BowWow! You created a park!'
    else
      render :new
    end
  end

  def show
    @check_in = CheckIn.new
    @park = Park.find(params[:id])
  end


  private

  def park_params
    params.require(:park).permit(:name, :address, :city, :state, :zip_code, :description)
  end

end
