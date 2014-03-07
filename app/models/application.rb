class Application < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :position

  validates_numericality_of :stage, :rating
end
