class ExercicesController < ApplicationController
  before_action :authenticate_user!
    
    def index
        exos = User.find(current_user.id).my_performances.map do |perf|
                Exercice.find(perf.exercice_id)
        end
        exos = Exercice.find(exos.map { |h| h['id'] }.uniq)
        render json: exos
    end
    def show
        @performances = MyPerformance.where(user_id: current_user.id, exercice_id: params[:id]);
        render json: @performances
    end
    def create
        @exo = Exercice.where(id: params[:id])
        render json: @exo
    end
end
