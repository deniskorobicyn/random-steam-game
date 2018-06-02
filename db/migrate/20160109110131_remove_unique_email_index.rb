class RemoveUniqueEmailIndex < ActiveRecord::Migration[4.2]
  def up
    sql = 'DROP INDEX index_users_on_email'
    ActiveRecord::Base.connection.execute(sql)
  end

  def down
    p 'Skipping'
  end
end
