class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy, :edit]
  before_action :set_recent_cocktails, only: [:index, :recent]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      flash[:notice] = "Cocktail #{@cocktail.name} has been created"
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def recent
    @cocktails = Cocktail.all.order(created_at: :desc).take(2)
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, photos: [] )
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def set_recent_cocktails
    @recent_cocktails = Cocktail.all.order(created_at: :desc).take(2)
  end
end

