class Wiki < ActiveRecord::Base
  belongs_to :user, dependent: :destroy

#  scope :private_wiki, -> (user) { where(public: true) }
#  scope :public_wiki, -> (user) { where)public: false) } 
end
