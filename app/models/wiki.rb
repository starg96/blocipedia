class Wiki < ActiveRecord::Base
  belongs_to :user, dependent: :destroy

  has_many :collaborators, through: :users

  scope :visible_to, -> (user) { user ? all : where(private: true) }
end
