require 'sinatra'
require 'sinatra/json'
require 'json'

get '/' do
  erb :index
end

get '/cake.json' do
  file = File.open("cake.list") 
  file_data = file.readlines.map(&:chomp)

  file_data.to_json
end