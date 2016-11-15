class User < ApplicationRecord
  #adding a validation to the model and adding some limitation around user name and to set
  #some limitations around user name lengths.
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
