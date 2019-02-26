class Recipe
  attr_reader :name,
              :ingredients_required,
              :ingredients

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] = amount
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    @ingredients_required.sum do |ingredient,amount|
      amount * ingredient.calories
    end
  end

  def ingredient_summary
    summary = @ingredients_required.sort_by do |ingredient, amount|
      ingredient.calories * amount
    end.reverse
    summary.map! do |ingredient,amount|
      {ingredient: ingredient.name,
       amount: "#{amount} #{ingredient.unit}"}
    end
  end
end
