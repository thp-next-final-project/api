class ModsController < ApplicationController
    def index
        @mods = Mod.all
    
        render json: @mods
      end
    
      # GET /mods/1
      def show
        set_mod
        render json: { mod: @mod, meals: @mod.meals }
      end
    
      
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_mod
          @mod = Mod.find(params[:id])
        end

end
