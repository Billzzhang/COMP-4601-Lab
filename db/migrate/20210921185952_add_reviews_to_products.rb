class AddReviewsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :reviews, :integer, array: true, default: []
  end
end
