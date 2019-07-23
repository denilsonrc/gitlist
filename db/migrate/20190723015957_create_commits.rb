class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha
      t.string :author
      t.string :email
      t.date :date
      t.string :message

      t.timestamps null: false
    end
  end
end
