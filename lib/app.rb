require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)
require 'date'

# Print today's date
time = Time.new
puts "Current Time : " + time.ctime

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
  # Print the name of the toy
  # Print the retail price of the toy
  # Calculate and print the total number of purchases
  # Calculate and print the total amount of sales
  # Calculate and print the average price the toy sold for
  # Calculate and print the average discount (% or $) based off the average sales price

  products_hash["items"].each do |el|
    puts "#{el["title"].upcase}"
    puts "**********************************************"
    puts "Price: $#{el["full-price"]}"
    puts "Purchased: #{el["purchases"].length} item(s) sold."
    puts "Sales: $#{el["purchases"][0]["price"] + el["purchases"][1]["price"]}"
    aver_price = (el["purchases"][0]["price"] + el["purchases"][1]["price"]) / el["purchases"].length
    puts "Average price: $#{aver_price}"
    aver_discount = el["full-price"].to_i - aver_price
    puts "Average discount: $#{aver_discount.round(3)}"
    puts " "
    puts " "
  end
  puts "**********************************************"



	new = []

	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
  # Print the name of the brand
  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  # Calculate and print the total revenue of all the brand's toy sales combined

products = products_hash["items"]
brands = products.map{ |product| product["brand"] }.uniq

brands.each do |brand|
  # Print the name of the brand
  puts brand
  puts "******************************************"


  stock = 0
  price = 0
  sales = 0

  these_products = products_hash["items"].select { |item| item["brand"] == brand }
  toys = these_products.length

  products.each do |product|
    stock = stock + product["stock"]
    price = price + product["full-price"].to_f
      sales = sales + product["purchases"].length

    # Count and print the number of the brand's toys we stock
    puts "Toys in stock: #{product["stock"]}" if product["brand"] == brand
  end

  # Calculate and print the average price of the brand's toys
  puts "Average Price of Toy: $#{(price / toys).round(2)}"

  # Calculate and print the total revenue of all the brand's toy sales combined
  puts "Toys sold: #{sales}"

  puts " "
end
