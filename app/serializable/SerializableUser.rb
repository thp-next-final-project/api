class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :email, :firstname, :lastname, :role, :age, :weight, :height, :activity, :sexe, :objectif
end
