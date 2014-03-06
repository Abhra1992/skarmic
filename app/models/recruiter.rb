class Recruiter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_and_belongs_to_many :positions

  validates :username, presence: true, uniqueness: true

  def name
    "%s %s" % [fname, lname]
  end
  alias to_s name
end
