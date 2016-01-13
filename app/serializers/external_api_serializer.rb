class ExternalApiSerializer < ActiveModel::Serializer
  attributes :id, :weather, :genre, :profile_id, :track, :current
end
