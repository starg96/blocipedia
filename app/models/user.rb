class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable
  after_initialize :set_to_default

  def admin?
  	role == 'admin'
  end

  def standard?
  	role == 'standard'
  end

  def premium?
  	role == 'premium'
  end

  def set_to_default
  	self.role = 'standard' 
  end
end
