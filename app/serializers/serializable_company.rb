class SerializableCompany < JSONAPI::Serializable::Resource
  type 'company'

  attributes :id, :name, :about, :image, :background_image, :address, :tel
  has_many :advertisings
  belongs_to :user
end
