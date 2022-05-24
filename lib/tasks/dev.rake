namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
  if Rails.env.development?
   puts %x(rails db:drop db:create db:migrate)
   %x(rails dev:add_mineration)
   %x(rails dev:add_coins)
   
   
   
  end
    
  end
  
  desc "Cadastra as Coins"
  task add_coins: :environment do
       
    coins =[
    
            {
              description: "Bitcoin",
              acronym: "BTC",
              url_image: "https://pngimg.com/uploads/bitcoin/small/bitcoin_PNG47.png",
              mining_type: MiningType.find_by(acronym: 'PoW')
            },



            {
              description: "Ethereum",
              acronym: "ETC",
              url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png",
              mining_type: MiningType.all.sample
            },



            {
              description: "Dash",
              acronym: "Dash",
              url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png",
              mining_type: MiningType.all.sample
            
            }]

    
      
            
         coins.each do |coin|
         Coin.find_or_create_by!(coin)
         end
      end
      
      desc "Cadastra as Mineracoes"
      task add_mineration: :environment do
      mining_types = [
          {
              description: "Proof of Work", acronym:"PoW"
          },
          {
              description: "Proof of Stack", acronym:"PoS"
          },
          {
              description: "Proof of Capacity", acronym:"PoC"
          },
          
          
          ]
            
          mining_types.each do |mining_type|
          MiningType.find_or_create_by!(mining_type)
          end
      end



end

