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

    def count_by_name(items)
  	result = {}
  	items.each do |item|
  		if result.has_key?(item.name)
  			result[item.name] += 1
  		else
  			result[item.name] = 1
  		end
  	end
  	return result
  end

  def print_report(items)
  	avg = average_price(items)
  	brands = count_by_brand(items)
  	names = count_by_name(items)

  	result = "Average Price: $#{avg}\n"

  	result << "Inventory by Brand:\n"
  	brands.each do |brand, count|
  		result << "- #{brand}: #{count}\n"
  	end

  	result << "Inventory by Name:\n"
  	names.each do |name, count|
  		result << "- #{name}: #{count}\n"
  	end
  	return result
  end
end
