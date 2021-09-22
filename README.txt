Link: comp4601.billzzhang.com

Demo: https://mediaspace.carleton.ca/media/1_v3bbula1


## Routes
| Routes        | Explanation                   |
|---------------| :----------------------------:|
|/products      | displays all the products     |
|/products/new  | form for creating new products|
|/products/:product_id| Detailed page for one product of :product_id|
|/products/:product_id/reviews | List of all reviews of a single provided product|
|/products/:product_id/reviews/new| Form for creating a new review of a single product|

Explanation: The routes are based on the models that it uses. For example, the Product model has routes that show all products for a dedicated route. In addition, the new route is dedicated to creating a new product.