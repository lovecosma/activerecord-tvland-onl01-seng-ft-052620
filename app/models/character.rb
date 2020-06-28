class Character < ActiveRecord::Base
  belongs_to :show
  belongs_to :actor


  def say_that_thing_you_say
    self.name + " always says: " + self.catchphrase
  end

  def build_show(name: "")
    new_show = Show.new
    new_show.name = name
    self.show = new_show
  end


end
