builtjson = []

@orders.each do |order|
  jsonobject = {}
  jsonobject[:name] = order.name
  lineitems = {}
  order.line_items.each do |line_item|
    lineitems["#{request.domain}:3000/products/#{line_item.product_id}"] = line_item.quantity
  end
  jsonobject[:items] = lineitems
  builtjson << jsonobject
end

json.array! builtjson
