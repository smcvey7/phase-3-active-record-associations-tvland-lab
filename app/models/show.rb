class Show < ActiveRecord::Base
  belongs_to :network
  has_many :characters
  has_many :actors, through: :characters

  def network
    # binding.pry
    nbc = Network.find_or_create_by(call_letters: "NBC", id: nil)
    self.network = nbc
    Network.first
  end

  def actors_list
    self.actors.select do |actor|
      return "#{actor.first_name} #{actor.last_name}"
    end
  end

end