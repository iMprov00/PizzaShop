require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "pizzashop.db"}

class Product < ActiveRecord::Base

end

class Order < ActiveRecord::Base 

end

get '/' do 

	@products = Product.all
	erb :index

end

post '/place_order' do 

	@order = Order.create params[:order]


	erb :order_placed

end

post '/cart' do 
	@orders_input = params[:orders]
	@items = parse_orders_line @orders_input

	if @items.length == 0
		return erb :cart_is_empty
	end

	@total = 0
	@quantity_all = 0

	@items.each do |item|

		item[0] = Product.find(item[0])
		@total += item[0].price.to_i * item[1].to_i
		@quantity_all += item[1].to_i

	end

	@items.sort_by! { |item| item[0][:id].to_i }


	erb :cart

end

def parse_orders_line orders_input

	s1 = orders_input.split(/,/)

	arr = []

	s1.each do |x|
		s2 = x.split (/=/)

		s3 = s2[0].split(/_/)

		id = s3[1]
		cnt = s2[1]

		arr2 = [id, cnt]

		arr.push arr2
	end

	return arr

end

