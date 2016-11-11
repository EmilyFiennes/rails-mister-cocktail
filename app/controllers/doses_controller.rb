class DosesController < ApplicationController

  def show
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new #cocktail has many doses - plural
    @ingredient = Ingredient.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail) #render 'cocktails/show'
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy #deletes from db but doesn't delete the instance which still has the id of the cocktail
    redirect_to cocktail_path @dose.cocktail
  end

  private

  def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
  end

end



