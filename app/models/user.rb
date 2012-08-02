class User < ActiveRecord::Base
  has_many :projects

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  
  attr_accessor :login
  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :name, :email, :password, :password_confirmation, :remember_me, :authentication_keys => [:login]
  # attr_accessible :title, :body

  def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
  end

end
