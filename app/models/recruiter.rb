class Recruiter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_and_belongs_to_many :positions
  has_many :applications, through: :positions
  has_many :messages, as: :messager
  has_many :notes

  validates_presence_of :fname, :lname
  validates :username, presence: true, uniqueness: true

  mount_uploader :avatar, AvatarUploader

  def name
    "%s %s" % [fname, lname]
  end
  alias to_s name
end
