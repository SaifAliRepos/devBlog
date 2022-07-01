# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(name: 'Admin', role: 'admin', email: 'admin@gmail.com', password: '123456',
             password_confirmation: '123456', confirmed_at: Time.now)

User.create!(name: 'Moderator', role: 'moderator', email: 'moderator@gmail.com', password: '123456',
             password_confirmation: '123456', confirmed_at: Time.now)

User.create!(name: 'User1', role: 'user', email: 'user@gmail.com', password: '123456', password_confirmation: '123456',
             confirmed_at: Time.now)

puts 'Users Created'

Post.create(user_id: 1, name: 'First Post', title: 'Default post by admin', status: 'pending')

Post.create(user_id: 1, name: 'First Post', title: 'Default post by admin with status published', status: 'publish')
