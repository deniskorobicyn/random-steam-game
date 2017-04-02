class CreateGameGenres < ActiveRecord::Migration[5.0]
  def up
    create_table :game_genres do |t|
      t.integer :game_id, null: false
      t.integer :genre_id, null: false

      t.timestamps
    end

     execute <<-SQL
      ALTER TABLE game_genres
        ADD FOREIGN KEY(genre_id)
        REFERENCES genres(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE;
      ALTER TABLE game_genres
        ADD FOREIGN KEY(game_id)
        REFERENCES games(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE;
    SQL

    execute <<-SQL
      CREATE UNIQUE INDEX game_genres_unique_idx
        ON game_genres (game_id, genre_id)
    SQL
  end

  def down
    drop_table :game_genres
  end
end
