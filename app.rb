require 'sinatra'
require 'sinatra/json'
require 'json'
require 'sequel'

# DB = Sequel.connect('postgres://cakeuser:cakeuser@localhost:5432/cakes')

get '/' do
  erb :index
end

# get '/cake.json' do
#   result = DB[:cakelist]
#   return result.all.to_json
# end

# get '/show/:id' do
#   erb :show
# end

# get '/edit/:id' do
#   erb :edit
# end

# post '/editsuccess/:id' do
#   DB[:cakelist].where(id: params["id"]).update(name: params["cakename"])
#   return "Success"
# end