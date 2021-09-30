builtjson = []

@orders.each do |order|
  jsonobject = {}
  jsonobject[:name] = order.name
  lineitems = {}
  order.line_items.each do |line_item|
    lineitems["#{ENV["host"]}/products/#{line_item.product_id}"] = line_item.quantity
  end
  jsonobject[:items] = lineitems
  builtjson << jsonobject
end

json.array! builtjson
