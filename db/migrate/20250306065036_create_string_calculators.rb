class CreateStringCalculators < ActiveRecord::Migration[8.0]
  def change
    create_table :string_calculators do |t|
      t.string :string_number
      t.integer :sum_number

      t.timestamps
    end
  end
end
