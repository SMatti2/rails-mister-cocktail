class DosesController < ApplicationController
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail_id)
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
