class SerializableAdvertising < JSONAPI::Serializable::Resource
  type 'advertising'

  attributes :job_title, :job_description, :salary
  belongs_to :company
end