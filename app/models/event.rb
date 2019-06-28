class Event < ApplicationRecord
  belongs_to :organization
  has_many :attendees, :dependent => :delete_all
  has_many :users, through: :attendees
end
