class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications


  def self.first_five
    self.limit(5)
  end

  def self.dinghy
    self.where(length: 0..19.99)
  end

  def self.ship
    self.where(length: 20..1000)
  end

  def self.last_three_alphabetically
    self.order(:name).reverse_order.limit(3)
  end

  def self.without_a_captain
    self.where(captain_id: nil)
  end

  def self.sailboats
    self.where(classification: "Sailboat")
  end
end
