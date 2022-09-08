class RemoveAmountFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :amount, :float
  end
end
