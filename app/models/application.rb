class Application < ActiveRecord::Base
  belongs_to :candidate
  alias applicant candidate
  belongs_to :position
  has_many :recruiters, through: :position
  has_many :messages
  has_many :messagers, through: :messages
  has_many :notes

  validates_numericality_of :stage, :rating

  def company
    position.company
  end

  def recent_messages
    messages.last(5)
  end

  def recent_notes
    notes.last(5)
  end
end
