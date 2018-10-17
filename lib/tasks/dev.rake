namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_moedas)
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end
  
  desc "Cadastra as moedas"
  task add_moedas: :environment do
    show_spinner("Cadastrando moedas...") do
      moedas = [
                { 
                  description: "Bitcoin",
                  acronym: "BTC",
                  url_image: "http://pngimg.com/uploads/bitcoin/bitcoin_PNG48.png",
                  mining_type: MiningType.find_by(acronym: 'PoW')
                },
                { 
                  description: "Ethereum",
                  acronym: "ETH",
                  url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXVXF5JqugayO9JqdGni8RYYT57b6By0pAy5xzmZnwlQ7DpTgo",
                  mining_type: MiningType.all.sample
                },
                { 
                  description: "Dash",
                  acronym: "DASH",
                  url_image: "https://static.coinpaprika.com/storage/cdn/currency_images/115661.png",
                  mining_type: MiningType.all.sample
                },
                { 
                  description: "Iota",
                  acronym: "IOT",
                  url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png",
                  mining_type: MiningType.all.sample
                },
                { 
                  description: "ZCash",
                  acronym: "ZEC",
                  url_image: "https://www.cryptocompare.com/media/351360/zec.png",
                  mining_type: MiningType.all.sample
                }
              ]
      
      moedas.each do |moeda|
        Moeda.find_or_create_by!(moeda)
      end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração...") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]
      
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end


  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")    
  end
end
  
  
