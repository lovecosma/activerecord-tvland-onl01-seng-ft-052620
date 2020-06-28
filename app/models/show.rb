class Show < ActiveRecord::Base
  belongs_to :network
  has_many :characters
  has_many :actors, through: :characters

  def build_network(call_letters: "")
    new_network = Network.new
    new_network.call_letters = call_letters
    new_network.shows << self
  end

  def actors_list
    actors_list_array = []
    self.actors.each do |actor|
      actors_list_array << actor.full_name
    end
    actors_list_array
  end


end
