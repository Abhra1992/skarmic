class Message < ActiveRecord::Base
  belongs_to :application
  belongs_to :messager, polymorphic: true

  validates_presence_of :body

  def show_messager
    "%s %s" % [messager_type, messager]
  end
end
