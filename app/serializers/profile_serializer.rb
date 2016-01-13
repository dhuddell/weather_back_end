class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :zip_code, :user_id, :current_weather
end
