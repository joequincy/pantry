require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_attributes_initialize_correctly
    assert_equal "Mac and Cheese", @mac_and_cheese.name
    assert_equal ({}), @mac_and_cheese.ingredients_required
  end

  def test_recipe_can_add_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    expected = {@mac => 8, @cheese => 2}
    assert_equal expected, @mac_and_cheese.ingredients_required
  end

  def test_recipe_can_return_amount_required_of_single_ingredient
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 8, @mac_and_cheese.amount_required(@mac)
    assert_equal 2, @mac_and_cheese.amount_required(@cheese)
  end

  def test_recipe_can_return_list_of_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal [@cheese, @mac], @mac_and_cheese.ingredients
  end

  def test_recipe_can_return_its_total_caloric_content
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 440, @mac_and_cheese.total_calories
  end
end
