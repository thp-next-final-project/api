class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :email, :firstname, :lastname, :role
end
