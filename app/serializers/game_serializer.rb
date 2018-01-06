class GameSerializer < ActiveModel::Serializer
  attributes :id, :steam_appid, :name, :full_image_url
end
