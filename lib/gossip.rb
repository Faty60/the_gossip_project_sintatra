require 'pry'
class Gossip
  attr_accessor :author, :content, :gossip_id

  def initialize(author, content)
    @author = author
    @content = content
    @gossip_id
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line| # va chercher chacune des lignes du csv do
    all_gossips << Gossip.new(csv_line[0], csv_line[1]) # crée un gossip avec les infos de la ligne
    end
    return all_gossips #on retourne un array rempli d'objets Gossip
  end
  
  def self.find(id) # renvoie un gossip à un id donné
    return Gossip.all[id]
  end


binding.pry
end
