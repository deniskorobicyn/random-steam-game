class CreateGenres < ActiveRecord::Migration[5.0]
  def up
    create_table :genres do |t|
      t.string :description, null: false

      t.timestamps
    end

    execute <<-SQL
      CREATE UNIQUE INDEX genres_unique_descriptions
        ON genres (description)
    SQL
  end

  def down
    drop_table :genres
  end
end
