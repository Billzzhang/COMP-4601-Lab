class RemoveReviewFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :review, :integer
  end
end
