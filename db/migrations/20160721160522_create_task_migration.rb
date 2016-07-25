class CreateTaskMigration < ActiveRecord::Migration

  def change
    create_table(:tasks) do |t|
      t.string(:name)
      t.string(:due_date)
      t.boolean(:complete)
      t.timestamps null: false
    end
  end
end
