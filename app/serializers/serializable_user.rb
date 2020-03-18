class SerializableUser < JSONAPI::Serializable::Resource
  type 'user'

  attributes :name, :last_name, :age, :gender, :tel, :image, :email, :password, :role
  has_many :skills
  has_many :resumes
  has_many :demands
  has_one :company
end