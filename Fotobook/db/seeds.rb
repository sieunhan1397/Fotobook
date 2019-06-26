# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
# User.create([{ name: 'Nhan', email: 'sieunhan1397@gmail.com', password: '123' }])
# User.create([{ name: 'Nhan', email: 'sieunhan1397@gmail.com', password: '123' }])
# User.create([{ name: 'Nhan', email: 'sieunhan1397@gmail.com', password: '123' }])
# User.create([{ name: 'Nhan', email: 'sieunhan1397@gmail.com', password: '123' }])
# User.create([{ name: 'Nhan', email: 'sieunhan1397@gmail.com', password: '123' }])

# puts "Done"

Photo.destroy_all
Photo.create([{ user_id: 16, title: 'DDD', description: 'dididi', url: 'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=2&h=650&w=940' }])
Photo.create([{ user_id: 17, title: 'CCC', description: 'cicici', url: 'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=2&h=650&w=940' }])
Photo.create([{ user_id: 18, title: 'DDD', description: 'dididi', url: 'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=2&h=650&w=940' }])
Photo.create([{ user_id: 19, title: 'DDD', description: 'dididi', url: 'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=2&h=650&w=940' }])
Photo.create([{ user_id: 20, title: 'DDD', description: 'dididi', url: 'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=2&h=650&w=940' }])

puts "Done"

Album.destroy_all
Album.create([{ user_id: 16, title: 'DDD', description: 'dididi' }])
Album.create([{ user_id: 17, title: 'CCC', description: 'cicici' }])
Album.create([{ user_id: 18, title: 'DDD', description: 'dididi' }])
Album.create([{ user_id: 19, title: 'DDD', description: 'dididi' }])
Album.create([{ user_id: 20, title: 'DDD', description: 'dididi' }])
puts "Done"