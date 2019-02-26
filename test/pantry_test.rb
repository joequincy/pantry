require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")

    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_attributes_initialize_correctly
    assert_equal ({}), @pantry.stock
  end

  def test_pantry_can_check_stock
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_pantry_can_restock
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_pantry_can_determine_if_it_has_enough_ingredients_for_recipe
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 8)
    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end
end
