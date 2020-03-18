class SerializableDemand < JSONAPI::Serializable::Resource
  type 'request'

  attributes :job_title, :job_description, :salary
  belongs_to :user
end