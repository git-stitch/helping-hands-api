class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :logo_url, :mission_statement, :bio, :homepage_url, :address, :organization_contacts, :organization_socials, :organization_images, :organization_members
  
  has_many :supporters

  has_many :events, include_nested_associations: true
  
  def organization_members
    self.object.organization_members.map do |member|
      { 
        id: member.id,
        organization_id: member.organization_id,
        email: member.email
      }
    end
  end

end
