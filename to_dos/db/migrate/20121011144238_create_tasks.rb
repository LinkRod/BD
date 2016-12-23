class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      # Completa con las columnas que necesites
      t.string :task
      t.boolean :status
    end
  end
end
