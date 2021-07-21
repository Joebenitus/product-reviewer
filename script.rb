#!/usr/bin/env ruby

require('./lib/product.rb')

file = ARGV[0]

product = Product.new(file)

puts product.review