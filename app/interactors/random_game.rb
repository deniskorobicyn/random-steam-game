class RandomGame
  include Interactor

  def call
    games = Steam::Player.owned_games(
      context.user.steamid,
      params: {
        include_appinfo: '1',
        include_played_free_games: '1'
      }
    )
    result = games["games"].map do |game|
      {
        name: game["name"],
        img: "http://media.steampowered.com/steamcommunity/public/images/apps/#{game["appid"]}/#{game["img_logo_url"]}.jpg"
      }
    end.sample

    context.game = result[:name]
    context.img = result[:img]
  end
end
