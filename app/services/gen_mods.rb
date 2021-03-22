class GenMods
  def initialize(current_user)
  end

  def gen_breakfast
  end

  def gen_lunch
  end

  def gen_dinner
  end

  def perform
    return {
      :calorie => 1990,
      :meals => [
      {
        :title => "breakfast",
        :name => "Omelette",
        :calorie => 300,
        :ingredients => [
          {
            :name => "Oeuf",
            :quantity => 3
          },
          {
            :name => "Beurre",
            :weight => 50
          }
        ]
      },
      {
        :title => "lunch",
        :name => "Soupe coco",
        :calorie => 300,
        :ingredients => [
          {
            :name => "Nouilles chinoises",
            :weight => 50
          },
          {
            :name => "Champignons",
            :weight => 50
          },
          {
            :name => "Lait Coco",
            :liter => 50
          }
        ]
      },
      {
        :title => "dinner",
        :name => "Soupe coco",
        :calorie => 300,
        :ingredients => [
          {
            :name => "Nouilles chinoises",
            :weight => 50
          },
          {
            :name => "Champignons",
            :weight => 50
          },
          {
            :name => "Lait Coco",
            :liter => 50
          }
        ]
      }]
    }
  end
end