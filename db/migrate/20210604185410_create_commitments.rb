class CreateCommitments < ActiveRecord::Migration[6.1]
  def change
    create_table :commitments do |t|
      t.string :target
      t.text :description
      t.integer :donation_size, default:0
      #t.date :start_date
      #t.date :end_date
      t.string :status
      t.references :cause, null: false, foreign_key: true
      t.belongs_to :owner, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
