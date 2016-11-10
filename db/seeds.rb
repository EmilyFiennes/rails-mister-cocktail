# require 'json'
# require 'open-uri'

Ingredient.destroy_all

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

ingredient["drinks"].each { |i| Ingredient.create(name: i["strIngredient1"].capitalize) }

puts 'Seed done'
