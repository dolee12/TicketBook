class User < ActiveRecord::Base
  has_many :stores
  has_many :tickets
end
