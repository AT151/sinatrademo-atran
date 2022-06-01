require 'sinatra'
require 'sinatra/json'
require 'json'
require 'sequel'

DB = Sequel.connect('postgres://cakeuser:cakeuser@localhost:5432/cakes')

get '/' do
  erb :index
end

get '/cake.json' do
  result = DB[:cakelist]
  return result.all.to_json
end