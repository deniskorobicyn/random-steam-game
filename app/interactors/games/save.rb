module Games
  class Save
    include Interactor

    delegate :params, :current_user, :game, :genres_names, to: :context

    def call
      Game.transaction do
        context.fail! unless game.update(params)

        if current_user
          ug = UserGame.find_or_initialize_by(game: game, user: current_user)
          context.fail! unless ug.save
        end

        if genres_names.present?
          context.fail! unless save_genres
        end
      end
    end

    private

    def save_genres
      genres_names.all? do |description|
        genre = Genre.find_or_initialize_by(description: description)

        genre.save && game.game_genres.find_or_create_by(genre_id: genre.id)
      end
    end
  end
end
