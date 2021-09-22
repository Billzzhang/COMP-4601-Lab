class AddReviewToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :review, :integer, array: true, default: []
  end
end
