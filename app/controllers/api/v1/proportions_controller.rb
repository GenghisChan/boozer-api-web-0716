module Api
  module V1
    class ProportionsController < ApplicationController

      def create
        @proportion = Proportion.create(proportion_params)
        byebug
      end

      private
        def proportion_params
          params.require(:proportion).permit(:cocktail_id, :ingredient_id, :amount)
        end

    end
  end
end
