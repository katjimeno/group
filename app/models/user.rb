class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  class << self
    def serialize_from_session(key,salt)                              
      record = to_adapter.get(key.to_s)
      record if record && record.authenticatable_salt == salt
    end
  end
end
