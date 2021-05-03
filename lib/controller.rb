require 'gossip'

class ApplicationController < Sinatra::Base # Grâce à l'héritage, la classe aura toutes les fonctionnalités que propose la classe Sinatra::Base (= toutes les fonctionnalités de base de Sinatra).
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end
  
  post '/gossips/new/' do
    params["gossip_author"]
    params["gossip_content"]
    Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
    redirect '/'
  end

  get "/gossips/:id/" do
    #gossip_id = params['id'].to_i
    puts "Hello #{params['id']}!"
  end


#   post '/gossips/new/' do
#     puts "Salut, je suis dans le serveur"
#     puts "Ceci est le contenu du hash params : #{params}"
#     puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
#     puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
#     puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
#   end
end
