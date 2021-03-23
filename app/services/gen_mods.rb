class GenMods
  def initialize(current_user)
    @total_cal = 2000
    @calories_by_meal = @total_cal / 3
  end

  def meal_picker(meals)
    meal_index = rand(0..meals.all.length - 1)
    return meals[meal_index]
  end

  def get_ingredient(ingredient, calories_ingredient)
    if (ingredient.quantity != 0)
      return {
        :name => ingredient.name,
        :quantity => calories_ingredient / ingredient.cal_per_something
      }
    end
    if (ingredient.weight != 0)
      return {
        :name => ingredient.name,
        :weight => calories_ingredient / ingredient.cal_per_something
      }
    end
    if (ingredient.liter != 0)
      return {
        :name => ingredient.name,
        :liter => calories_ingredient / ingredient.cal_per_something
      }
    end
  end
  def gen_breakfast
    calories_breakfast = @calories_by_meal
    breakfast = meal_picker(Meal.breakfasts.includes(:ingredients))
    calories_ingredient = calories_breakfast / breakfast.ingredients.length
    ingredients = []
    breakfast.ingredients.each do |ingredient|
      ingredients << get_ingredient(ingredient, calories_ingredient)
    end
    return { 
      :title => "breakfast",
      :name => breakfast.name,
      :calories => calories_breakfast,
      :ingredients => ingredients
    }
  end

  def gen_lunch
    calories_lunch = @calories_by_meal
    lunch = meal_picker(Meal.lunchs.includes(:ingredients))
    calories_ingredient = calories_lunch / lunch.ingredients.length
    ingredients = []
    lunch.ingredients.each do |ingredient|
      ingredients << get_ingredient(ingredient, calories_ingredient)
    end
    return { 
      :title => "lunch",
      :name => lunch.name,
      :calories => calories_lunch,
      :ingredients => ingredients
    }
  end

  def gen_dinner
    calories_dinner = @calories_by_meal
    dinner = meal_picker(Meal.dinners.includes(:ingredients))
    calories_ingredient = calories_dinner / dinner.ingredients.length
    ingredients = []
    dinner.ingredients.each do |ingredient|
      ingredients << get_ingredient(ingredient, calories_ingredient)
    end
    return { 
      :title => "dinner",
      :name => dinner.name,
      :calories => calories_dinner,
      :ingredients => ingredients
    }
  end

  def perform
    return {
      :calories => @total_cal,
      :meals => [
      gen_breakfast,
      gen_lunch,
      gen_dinner
    ]}
  end
end