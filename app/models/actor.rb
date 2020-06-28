class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
  self.first_name + " " + self.last_name
  end

  def list_roles
    roles_and_shows = []
    self.shows.each do |show|
      roles_and_shows << show.characters.name + " - " + self.shows.name
     end
  end
end
