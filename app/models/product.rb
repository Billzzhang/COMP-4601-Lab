class Product < ApplicationRecord
	validates :name, presence: true

	def self.search(search, instock)
		if search
			if instock
				Product.where("name like ?", "%#{search}%").where("stock > ?", 0)
			else
				Product.where("name like ?", "%#{search}%")
			end
		else
			@products = Product.all
		end
	end
end
