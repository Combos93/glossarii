class CreateTermins < ActiveRecord::Migration[5.2]
  def change
    create_table :termins do |t|
      t.string :name
      t.string :translation
      t.string :example
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
