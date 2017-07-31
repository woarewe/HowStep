class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.string :title
      t.references :post, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
