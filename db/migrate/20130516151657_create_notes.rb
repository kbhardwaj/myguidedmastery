class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.string :title
      t.string :author

      t.timestamps
    end
  end
end
