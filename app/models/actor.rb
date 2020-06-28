class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
  self.first_name + " " + self.last_name
  end

  def list_roles
    roles_and_shows = []
    self.characters.each do |character|
      roles_and_shows << character.name + " - " + character.show.name
     end
     roles_and_shows
  end



end
