class OrganizationMemberSerializer < ActiveModel::Serializer
  attributes :id, :email, :organization
end
