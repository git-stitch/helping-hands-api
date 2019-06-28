class SupporterSerializer < ActiveModel::Serializer
  attributes :id, :organization_id, :user_id, :user

    def user 
      { 
        id: self.object.user.id,
        email: self.object.user.email
      }
    end
end
