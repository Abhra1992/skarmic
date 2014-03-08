class Candidate < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :applications
  has_many :positions, through: :applications
  has_many :messages, as: :messager

  validates_presence_of :fname, :lname
  validates :username, presence: true, uniqueness: true

  mount_uploader :avatar, AvatarUploader

  def name
    "%s %s" % [fname, lname]
  end
  alias to_s name
end
