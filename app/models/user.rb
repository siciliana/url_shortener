class User < ActiveRecord::Base

  require 'bcrypt'
  has_secure_password
  has_many :links 

  def self.authenticate(email,password)
    user = User.find_by_email(email)
    if user != nil
        if user.password == password
          # session[:user_id] = user.id
          return user.id
        # elsif
        #   user.email == nil 
        #   false
        else
          false 
        end 
    else 
      false
    end 
  end

    76767 
end
