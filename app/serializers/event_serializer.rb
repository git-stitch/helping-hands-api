class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :users 
  def users 
    self.object.users.map do |user|
      { 
        id: user.id,
        email: user.email
      }
    end
  end
end
