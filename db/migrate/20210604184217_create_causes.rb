class CreateCauses < ActiveRecord::Migration[6.1]
  def change
    create_table :causes do |t|
      t.string :image
      t.string :theme
      t.text :description
      #t.date :start_date
      #t.date :end_date
      t.string :status
      t.integer :funds_needed, default: 0
      t.integer :funds_raised, default: 0
      #t.integer :commitments_count, default: 0
      t.belongs_to :owner, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
