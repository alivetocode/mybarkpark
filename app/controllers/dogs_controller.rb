class DogsController < ApplicationController

  def index
    @dogs = current_owner.dogs
  end

  def create

    @dog = Dog.new(dog_params)
    @dog.owner = current_owner

    if @dog.save
      redirect_to owner_dog_path(current_owner, @dog), notice: 'Your dog was successfully created'
    else
      render :new
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to @dog, notice: 'Your dog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
      redirect_to owner_dogs_path(current_owner, @dog), notice: 'Your dog was successfully deleted'
  end


 private

  def dog_params
    params.require(:dog).permit(:name, :breed, :color, :photo_url, :gender, :personality_attributes, :owner_id)
  end

end
