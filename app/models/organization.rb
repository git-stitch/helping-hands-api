class Organization < ApplicationRecord
  has_many :supporters, :dependent => :delete_all
  has_many :events, :dependent => :delete_all
  has_many :organization_contacts, :dependent => :delete_all
  has_many :organization_socials, :dependent => :delete_all
  has_many :organization_images, :dependent => :delete_all
  has_many :attendees, through: :events
  has_many :users, through: :attendees
  has_many :organization_members
  has_many :donations
end
