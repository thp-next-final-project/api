class GetWodCalories
  def initialize(current_user, wod)
    @weight = current_user.weight
    @fc_max = 220 - current_user.age
    @fc = 160
    @wod = wod
  end

  def compute_time_effort

  end
  
  def depense_by_hour
    return 24 * @weight * (@fc / @fc_max - 0,25)
  end

  def perform
    return depense_by_hour / compute_time_effort
  end
end