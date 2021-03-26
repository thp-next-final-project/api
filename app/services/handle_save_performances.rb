class HandleSavePerformances
  def initialize(user, wods)
    @user_id = user.id
    @wods = wods
    @set = []
  end

  def find_weigth_equipement(id)
    return Equipement.find(id).weight
  end
  def save_exercices_wod(set)
    set[:exercices].each do |exercice|
      MyPerformance.create(user_id: @user_id, exercice_id: exercice[:id], repetitions: @set[:rep], weight: find_weigth_equipement(exercice[:equipement_id]))
    end
  end
  def save_exercices_building(set)
    set.each do |row|
      MyPerformance.create(user_id: @user_id, exercice_id: row[:exercice][:id], repetitions: row[:rep], weight: find_weigth_equipement(row[:exercice][:equipement_id]))
    end
  end

  def find_exercices
    i = 0
    while (@wods[i][:name] != "Wod" && @wods[i][:name] != "Renforcement") do
      i += 1
    end
    if (@wods[i][:name] === "Wod")
      save_exercices_wod(@wods[i][:set])
    end
    if (@wods[i][:name] === "Renforcement")
      save_exercices_building(@wods[i][:set])
    end
  end

  

  def perform
    find_exercices()
  end

end