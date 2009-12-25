class Bind < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates_presence_of :user, :project
  validates_uniqueness_of :user_id, :scope => [:project_id, :kind]

  symbolize :kind, :in => [:watch, :owner, :dev]
end
