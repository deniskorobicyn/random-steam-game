class GameDecorator < Draper::Decorator
  delegate_all

  def full_image_url
    return unless game.steam_appid
    "http://media.steampowered.com/steamcommunity/public/images/apps/#{game.steam_appid}/#{game.image_url}.jpg"
  end
end
