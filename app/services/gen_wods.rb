class GenWods
  def initialize(current_user)
    @user = current_user
    @my_equipements = MyEquipement.where(user_id: current_user)
    @wod = []
  end

  def pick_exercices(exercices)
    # choseen_exercices = []
    # p exercices
    # i = 0
    # max = rand(2..4)
    # t = []
    # max.times do
    #   t += rand(0..exercices.length)
    # end
    # while i <= max do
    #   choseen_exercices << exercices[t[i]]
    #   i += 1
    # end
    return exercices
  end

  def generate_warm_up
    exercices = []
    @my_equipements.each do |eq|
      exercices += Exercice.where(equipement_id: eq.equipement_id).warm_ups
    end

    @wod << { :name => "Echauffement", :time => { :min => rand(3..5), :sec => rand(0..60) } ,:rep_set => rand(1..3), :set => { :rep => rand(10..20), :exercices => pick_exercices(exercices) }}
  end

  def generate_skills
    exercices = []
    @my_equipements.each do |eq|
      exercices += Exercice.where(equipement_id: eq.equipement_id).skills
    end
    @wod << { :name => "Compétences", :time => { :min => rand(3..5), :sec => rand(0..60) } ,:rep_set => 1, :set => { :rep => 10, :exercices => pick_exercices(exercices) } }
  end

  def generate_workout
    exercices = []
    @my_equipements.each do |eq|
      exercices += Exercice.where(equipement_id: eq.equipement_id).workouts
    end
    @wod << { :name => "Wod", :time => { :min => rand(5..20), :sec => rand(0..60) } ,:rep_set => rand(1..3), :set => { :rep => rand(10..20), :exercices => pick_exercices(exercices) } }
  end
  
  def generate_building
    exercices = []
    @my_equipements.each do |eq|
      exercices += Exercice.where(equipement_id: eq.equipement_id).buildings
    end
    @wod << { :name => "Renforcement",:time => { :min => 1, :sec => 0 } , :rep_set => 3, :set => { :rep => 10, :exercices => pick_exercices(exercices) } }
  end

  def perform
    case rand(1..2)
    when 1
      generate_warm_up
      generate_skills
      generate_workout
    when 2
      generate_warm_up
      generate_building
    end
    # p @wod
    # p "#"*8
    # p " WOD"
    # p "#"*8
    # @wod.each do |parts|
    #   p "#"*8
    #   p parts[:name]
    #   p "#"*8
    #   parts[:exercices].each do |exercice|
    #     p exercice.name
    #     p exercice.equipement_id
    #     # p exercice.equipement.weight
    #   end
    # end
    return @wod
  end
end
 