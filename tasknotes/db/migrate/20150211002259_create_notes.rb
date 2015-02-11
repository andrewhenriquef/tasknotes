class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.references :task, index: true

      t.timestamps
    end
  end
end
