# This file should contain all the record creation needed to seed the database with its default values.

first_user = User.create!(name: 'Tom', user_avatar: '/assets/user_avatar-svgrepo-com.svg', email: 'tom@email.com', password: '123456')
second_user = User.create!(name: 'Lilly', user_avatar: '/assets/user_avatar-svgrepo-com.svg', email: 'lilly@email.com', password: '123456')
third_user = User.create!(name: 'Luis', user_avatar: '/assets/user_avatar-svgrepo-com.svg', email: 'luis@email.com', password: '123456')

first_food = Food.create!(user_id: first_user.id, name: 'Onion', measurement_unit: 'units', price: 0.1, quantity: 1)
second_food = Food.create!(user_id: first_user.id, name: 'Milk', measurement_unit: 'ml', price: 0.5, quantity: 80)
third_food = Food.create!(user_id: second_user.id, name: 'Vegetable Oil', measurement_unit: 'tablespoon', price: 0.2, quantity: 2)
fourth_food = Food.create!(user_id: second_user.id, name: 'Chicken stock', measurement_unit: 'cup', price: 0.5, quantity: 0.25)