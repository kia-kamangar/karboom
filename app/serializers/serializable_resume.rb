class SerializableResume < JSONAPI::Serializable::Resource
  type 'resume'

  attributes :resume_title, :start_date, :end_date
  belongs_to :user

end