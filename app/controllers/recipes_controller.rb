class RecipesController < ApplicationController
  def index
    @recipes = Recipes::GetAllEntries.new.call
  end

  def show
    @recipe = Recipes::GetEntry.new(params[:id]).call

    redirect_to recipes_path, notice: I18n.t('alerts.recipe_does_not_exist') unless @recipe
  end
end
