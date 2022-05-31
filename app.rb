require 'sinatra'
require 'sinatra/json'
require 'json'

get '/' do
  erb :index
end

get '/cake.json' do
  h = Hash.new
  file = File.open("cake.list") 
  file_data = file.readlines.map(&:chomp)

  file_data.each.with_index(1) do |x, index|
    h[index] = x
  end

  h.to_json
end