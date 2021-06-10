class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.belongs_to :owner, null: false, foreign_key: { to_table: :users }, index: true
      t.references :cause, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
