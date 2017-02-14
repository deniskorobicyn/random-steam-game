class CreateUserGames < ActiveRecord::Migration[5.0]
  def up
    create_table :user_games do |t|
      t.references :user
      t.references :game

      t.timestamps
    end

    execute <<-SQL
      ALTER TABLE user_games
        ADD FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE;
      ALTER TABLE user_games
        ADD FOREIGN KEY(game_id)
        REFERENCES games(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE;
    SQL

    execute <<-SQL
      CREATE UNIQUE INDEX user_games_unique_idx
        ON user_games (game_id, user_id)
    SQL
  end

  def down
    drop_table :user_games
  end
end
