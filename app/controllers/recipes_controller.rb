class RecipesController < ApplicationController
  def index
    @recipes = Contentful::EntriesService.new.call
  end

  def show
    @recipe = Contentful::EntryService.new(params[:id]).call

    redirect_to recipes_path, notice: I18n.t('alerts.recipe_does_not_exist') unless @recipe
  end
end
