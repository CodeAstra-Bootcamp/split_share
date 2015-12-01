class Group < ActiveRecord::Base
  belongs_to :admin, class_name: User.name

  validates :name,        presence: true
  validates :description, presence: true
end
