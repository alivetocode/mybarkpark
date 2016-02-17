class CheckInsController < ApplicationController

  def new
    @park = Park.find(params[:park_id])
    @check_in = CheckIn.new
    @owner = current_owner
  end

  def create
    @park = Park.find(params[:park_id])
    @check_in = CheckIn.new(dog_id: params[:dog_id], park: @park)

    if @check_in.save
      redirect_to park_path(@park), notice: "You and #{@check_in.dog.name} are checked in...have fun!"
    else
      render :new
    end
  end

  def show
    @check_in = CheckIn.find(params[:id])
  end

  def edit
    @check_in = CheckIn.find(params[:id])
  end

  def update
    @park = Park.find(params[:park_id])
    @check_in = CheckIn.find(params[:id])
    @check_in.check_out_at = DateTime.now
    if @check_in.save
      redirect_to park_path(@park), notice: "You and #{@check_in.dog.name} are checked out...go give that dog a snack!"
    else
      redirect_to park_path(@park), notice: 'oh no something went wrong try to checkout again'
    end

    # def delete
    #   CheckIn.find(params[:id]).destroy
    # end
  end

  private

  def dog_params
    params.require(:check_in).permit(:check_out_at, :dog_id, :park_id)
  end


end
