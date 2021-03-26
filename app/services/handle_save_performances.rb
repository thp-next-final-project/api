class HandleSavePerformances
  def initialize(user, wods)
    @user_id = user.id
    @wods = wods
    @set = []
  end

  def find_exercices
    i = 0
 
    while (@wods[i][:name] != "Wod" && @wods[i][:name] != "Renforcement") do
      i += 1
      puts i
      puts @wods[i][:name]
    end
    @set = @wods[i][:set]
  end

  def find_weigth_equipement(id)
    return Equipement.find(id).weight
  end
  def save_exercice
    @set[:exercices].each do |exercice|
      MyPerformance.create(user_id: @user_id, exercice_id: exercice[:id], repetitions: @set[:rep], weight: find_weigth_equipement(exercice[:equipement_id]))
    end
  end

  def perform
    find_exercices()
    save_exercice()
  end

end