class Company < ActiveRecord::Base
  validates_presence_of :name, :city, :state

  serialize :about
  serialize :benefits

  # def position_selector
  #   positions.map { |p| ["%s (%s)" % [p.title, p.count], p.id] }
  # end

  def to_s
    name
  end
end
