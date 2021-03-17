class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.all
    
        render json: @ingredients
      end
    
      # GET /mods/1
      def show
        set_ingredient
        render json: @ingredient
      end
    
      
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_ingredient
          @ingredient = Ingredient.find(params[:id])
        end
end
