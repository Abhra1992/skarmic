class Application < ActiveRecord::Base
  belongs_to :candidate
  alias applicant candidate
  belongs_to :position
  has_many :recruiters, through: :position
  has_many :messages
  has_many :messagers, through: :messages

  validates_numericality_of :stage, :rating

  def company
    position.company
  end
end
