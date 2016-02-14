require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "

	puts "Retail price: #{products_hash["items"][0]["full-price"]}$"

products_hash["items"].each do |toy|
	puts toy["title"] 
	puts "Retail price: #{toy["full-price"]}$"
	puts "Number of purchases: #{toy["purchases"].size}"
	amount_of_sales = 0
	i = 0 
	while i < toy["purchases"].size	# Loop that is adding sales, and store it in amount_of_sales variable. 
		amount_of_sales = amount_of_sales + toy["purchases"][i]["price"]
		i = i + 1
	end
	puts "Amount of sales: #{amount_of_sales}$"
	average = amount_of_sales / toy["purchases"].size 
	puts "Average price: #{average}$" 
	average_discount = (1 - amount_of_sales / toy["purchases"].size / toy["full-price"].to_i)*100 #Calculate average discount. 
	puts "Average discount :#{average_discount.round(2)}%" 
	puts
end




# For each product in the data set:
  # Print the name of the toy
  # Print the retail price of the toy
  # Calculate and print the total number of purchases
  # Calculate and print the total amount of sales
  # Calculate and print the average price the toy sold for
  # Calculate and print the average discount (% or $) based off the average sales price


	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts
brands=[]

products_hash["items"].each do |toy| # Loop makes an array with all brands
brands.push(toy["brand"])
end
uniq_brands=brands.uniq 	# Array with unique brands
i = 0

while i < uniq_brands.length do 
	stock = 0
	number_of_toys = 0
	sum_of_prices = 0
	brand_revenue = 0
	puts uniq_brands[i]
	products_hash["items"].each do |toy|
		if uniq_brands[i] == toy["brand"] 
			stock = stock + toy["stock"].to_i # Calculates stock for every brand
			sum_of_prices = sum_of_prices + toy["full-price"].to_f # Adds toy's prices of toys. 
			number_of_toys = number_of_toys + 1 # Count number of toys. 
			k = 0
			while k < toy["purchases"].length do # Loop that calculate brand revenue
				brand_revenue = (brand_revenue + toy["purchases"][k]["price"].to_f).round(2)
				k = k+1
			end
		end
	end
	average_price_of_toy = (sum_of_prices/number_of_toys).round(2) 
	puts "Stock: #{stock}"
	puts "Average price of toy :#{average_price_of_toy}$"
	puts "Brand's revenue: #{brand_revenue}$"
	puts
	i = i + 1
end

# For each brand in the data set:
  # Print the name of the brand
  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  # Calculate and print the total revenue of all the brand's toy sales combined
