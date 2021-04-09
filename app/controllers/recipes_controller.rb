class RecipesController < ApplicationController
  def index
    @recipes = begin
                 contentful_client.entries(content_type: 'recipe')
               rescue HTTP::ConnectionError, Contentful::Error => e
                 # TODO push exception to error tracker
                 Rails.logger.error(e.message)

                 []
               end
  end

  def show
    @recipe = begin
                contentful_client.entry(params[:id], include: 2)
              rescue HTTP::ConnectionError, Contentful::Error => e
                # TODO push exception to error tracker
                Rails.logger.error(e.message)

                nil
              end

    unless @recipe
      redirect_to recipes_path, notice: I18n.t('alerts.recipe_does_not_exist')
    end
  end

  private

  def contentful_client
    Contentful::Client.new(
      space: ENV['SPACE_ID'],
      access_token: ENV['ACCESS_TOKEN'],
      dynamic_entries: :auto,
      raise_for_empty_fields: false
    )
  end
end
