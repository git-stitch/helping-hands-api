class OrganizationMember < ApplicationRecord
  belongs_to :organization
  validates_uniqueness_of :email
  has_secure_password
end
