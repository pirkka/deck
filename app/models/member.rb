class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :company, :y_code, :linkedin, :twitter, :phone, :url
  # attr_accessible :title, :body

  attr_accessor :invite_code
  attr_accessible :invite_code

  attr_accessible :tables, :stealth
  
  validates_each :invite_code, :on => :create do |record, attr, value|
      record.errors.add attr, "Please enter correct invite code" unless
        value && value == ENV['INVITE_CODE']
  end
    
  def name
    "#{first_name} #{last_name}"
  end
  
end
