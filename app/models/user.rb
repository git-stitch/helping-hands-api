class User < ApplicationRecord
  has_many :attendees, :dependent => :delete_all
  has_many :events, through: :attendees
  has_many :supporters, :dependent => :delete_all
  has_many :organizations, through: :supporters
  has_secure_password
  validates_uniqueness_of :email
end
