class CookBook
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    @recipes.map do |recipe|
      details = {
        ingredients: recipe.ingredient_summary,
        total_calories: recipe.total_calories
      }
      output = {name: recipe.name, details: details}
    end
  end
end
