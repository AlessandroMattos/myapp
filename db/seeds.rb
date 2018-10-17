# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Criando Moedas"

Moeda.create!(
    description: "Ethereum",
    acrony:"ETH",
    url_image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXVXF5JqugayO9JqdGni8RYYT57b6By0pAy5xzmZnwlQ7DpTgo"
    )
Moeda.create!(
    description: "Bitcoin",
    acrony:"BTC",
    url_image:"http://pngimg.com/uploads/bitcoin/bitcoin_PNG48.png"
    )
Moeda.create!(
    description: "Dash",
    acrony:"DAS",
    url_image:"https://static.coinpaprika.com/storage/cdn/currency_images/115661.png"
    )
    
puts "moedas cadastradas com sucesso"

