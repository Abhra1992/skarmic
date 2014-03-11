class Note < ActiveRecord::Base
  belongs_to :application
  belongs_to :recruiter
  alias notetaker recruiter

  validates_presence_of :body
end
