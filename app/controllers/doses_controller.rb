class DosesController < ApplicationController
    before_action :set_dose, only: [:show, :destroy, :edit]
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
  end

  def create

    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id].to_i)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render "new"
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:cocktail_id, :ingredient_id, :description)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
