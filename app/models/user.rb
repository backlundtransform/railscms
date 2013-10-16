class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
  has_many :sites
  
  
  ROLES = %w[admin moderator author banned]
  
  
  
  def is?(roll)
    role == roll
  end
end
