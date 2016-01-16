class RandomGame
  include Interactor

  def call
    game = select_game

    context.game = game[:name]
    context.img = game[:img]
    context.appid = game[:appid]
  end

  def select_game
    games = Steam::Player.owned_games(
      context.user.steamid,
      params: {
        include_appinfo: '1',
        include_played_free_games: '1'
      }
    )

    games["games"].map do |game|
      {
        name: game["name"],
        img: "http://media.steampowered.com/steamcommunity/public/images/apps/#{game["appid"]}/#{game["img_logo_url"]}.jpg",
        appid: game["appid"]
      }
    end.sample
  end
end
