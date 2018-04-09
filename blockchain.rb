require 'sinatra'
require 'colorize'
require_relative 'helper'

include Blockchain

NAME = 'blocks.json'

get '/list' do
  if File.exist?(NAME) && JSON.parse(File.open(NAME, 'a+').read).size > 0
    print_blocks(NAME)
  else
    puts "Blockchain isn't exist yet".red
  end
end

get '/validate' do
  if File.exist?(NAME) && JSON.parse(File.open(NAME, 'a+').read).size > 0
    validate_blockchain(NAME)
  else
    puts "Blockchain is empty now".red
  end
end

post '/add_block' do
  user = params['user'].downcase
  value = params['value'].to_s
  unless File.exist?(NAME)
    genezis_block(NAME)
  end
  new_block = make_block(user, value, NAME)
  push_to_file(NAME, new_block)
  print_blocks(NAME)
end
