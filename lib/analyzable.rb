module Analyzable
  def average_price(items)
  	sum = 0
  	items.each do |item|
  		sum += item.price.to_f
  	end
  	avg = (sum / items.length).round(2)
  end

  def count_by_brand(items)
  	result = {}
  	items.each do |item|
  		if result.has_key?(item.brand)
  			result[item.brand] += 1
  		else
  			result[item.brand] = 1
  		end
  	end
  	return result
  end
end
