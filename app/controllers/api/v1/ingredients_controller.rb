module Api
  module V1
    class IngredientsController < ApplicationController

      def create
        @ingredient = Ingredient.create(ingredient_params)
        byebug
      end

      private
        def ingredient_params
          params.require(:ingredient).permit(:name)
        end

    end
  end
end
