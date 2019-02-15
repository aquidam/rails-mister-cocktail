require 'open-uri'
require 'json'
require 'faker'
puts 'Deleting databases...'

Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

puts 'Done!'
puts 'Generating new databases...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = open(url).read
parsed_response = JSON.parse(response)

ingredients_array = parsed_response['drinks'].sample(20)

ingredients_array = ingredients_array.map do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

10.times do
  new_cocktail = Cocktail.create!(
    name: "#{Faker::Science.element} #{Faker::Ancient.god}"
  )
  rand(2..5).times do
    new_dose = Dose.new
    until new_dose.save
      new_dose.description = "#{rand(1..3)} #{Faker::Food.metric_measurement}"
      new_dose.cocktail = new_cocktail
      new_dose.ingredient = ingredients_array.sample
    end
  end
end

puts 'Done!'
puts 'All done!!!'
