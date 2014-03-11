class Position < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :recruiters
  has_many :applications
  has_many :candidates, through: :applications
  alias applicants candidates

  serialize :skills_required
  serialize :skills_desired
  serialize :responsibilities

  validates_presence_of :title
  validates :count, presence: true, numericality: { only_integer: true }

  def to_s
    title
  end

  def contacts
    recruiters.map(&:email)
  end
end
