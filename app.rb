require 'sinatra'
require 'sinatra/json'
require 'json'
require 'sequel'

DB = Sequel.connect('postgres://fzkhgnzqiegvhz:7ede47178ef23ef790d2d99b6d46b9ea9c88a2172670f36202abc1dc85017339@ec2-34-227-120-79.compute-1.amazonaws.com:5432/dafanfgl4e086n')

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