class Student < ApplicationRecord
  has_many :addresses
  validates_presence_of :name
end