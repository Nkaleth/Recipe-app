# This file should contain all the record creation needed to seed the database with its default values.

first_user = User.create!(name: 'Tom', user_avatar: '/assets/user_avatar-svgrepo-com.svg', email: 'tom@email.com', password: '123456')
second_user = User.create!(name: 'Lilly', user_avatar: '/assets/user_avatar-svgrepo-com.svg', email: 'lilly@email.com', password: '123456')
third_user = User.create!(name: 'Luis', user_avatar: '/assets/user_avatar-svgrepo-com.svg', email: 'luis@email.com', password: '123456')

# foods for Tom
first_food = Food.create!(user_id: first_user.id, name: 'Onion', measurement_unit: 'units', price: 0.1)
second_food = Food.create!(user_id: first_user.id, name: 'Milk', measurement_unit: 'ml', price: 0.5, quantity: 10)

# foods for Lilly
third_food = Food.create!(user_id: second_user.id, name: 'Vegetable Oil', measurement_unit: 'tablespoon', price: 0.2, quantity: 1)
fourth_food = Food.create!(user_id: second_user.id, name: 'Chicken stock', measurement_unit: 'cup', price: 0.5, quantity: 0.25)
fifth_food = Food.create!(user_id: second_user.id, name: 'Cloves Garlic', measurement_unit: 'units', price: 0.1, quantity: 1)

# Recipe: Ají de Gallina

first_recipe = Recipe.create!(user_id: first_user.id, name: 'Ají de Gallina', description: 'A favorite Peruvian chicken recipe of creamy, spicy sauce made with shredded chicken or hen, aji amarillo chili peppers, minced garlic, pecan nuts, parmesan, hard boiled eggs, and bread crumbs. All served over rice with a few slices of boiled potatoes.', prep_time: 60, cook_time: 45, public: false)

# Recipe: Potato Huancaina's Style

second_recipe = Recipe.create!(user_id: first_user.id, name: 'Potato Huancaina Style', description: 'A favorite Peruvian chicken recipe of creamy, spicy sauce made with...', prep_time: 60, cook_time: 45, public: false)

# Recipe foods: Ají de Gallina

first_recipe_food = RecipeFood.create!(recipe_id: first_recipe.id, food_id: first_food.id, quantity: 1)
second_recipe_food = RecipeFood.create!(recipe_id: first_recipe.id, food_id: second_food.id, quantity: 80)

# Recipe foods: Potato Huancaina's Style

third_recipe_food = RecipeFood.create!(recipe_id: second_recipe.id, food_id: second_food.id, quantity: 20)
