class SerializableSkill < JSONAPI::Serializable::Resource
  type 'skill'

  attributes :skill_title, :skill_level
  belongs_to :user
end