module Api
  module V1
    class CocktailsController < ApplicationController
      def index
        render json: Cocktail.all
      end

      def show
        cocktail = Cocktail.find(params[:id])

        cocktail_json = {
          id: cocktail.id,
          name: cocktail.name,
          description: cocktail.description,
          instructions: cocktail.instructions,
          source: cocktail.source,
          proportions: cocktail.proportions.map do |prop|
            {
              id: prop.id,
              ingredient_name: prop.ingredient.name,
              amount: prop.amount
            }
          end
        }

        render json: cocktail_json
      end

      def create
        @cocktail = Cocktail.new(name: params["cocktail"]["name"], description: params["cocktail"]["description"], instructions: params["cocktail"]["instructions"], source: params["cocktail"]["source"])

        if @cocktail.save
        params["cocktail"]["proportions"].each do |proportion|
          @ingredient = Ingredient.find_or_create_by(name: proportion["ingredient_name"])

          @proportion = Proportion.create(cocktail_id: @cocktail.id, ingredient_id: @ingredient.id, amount: proportion["amount"])
          # create Proportion
          @cocktail.proportions << @proportion
          end
        end
      end

      def edit

      end

      def update

      end

      def destroy

      end

      private

      # def cocktail_params
      #   params.require(:cocktail).permit(:name, :instructions, :description, :source, :proportions)
      # end

    end
  end
end
