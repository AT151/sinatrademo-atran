require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'
require 'json'
# require 'sequel'

set :database_file, 'config/database.yml'

# DB = Sequel.connect('postgres://fzkhgnzqiegvhz:7ede47178ef23ef790d2d99b6d46b9ea9c88a2172670f36202abc1dc85017339@ec2-34-227-120-79.compute-1.amazonaws.com:5432/dafanfgl4e086n')
# DB = Sequel.connect('postgres://cakeuser:cakeuser@localhost:5432/cakes')

class Cake < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end

get '/' do
  erb :index
end

get '/cake.json' do
  return json Cake.select('id', 'name').all
end

get '/show/:id' do
  erb :show
end

get '/update/:id' do
  erb :update
end

get '/new' do
  erb :new
end

# Create
post '/' do
  cake = Cake.create(params)
  if cake
    erb :index
  else
    halt 500
  end
end

# Update
post '/update/:id' do
  cake = Cake.find_by_id(params[:id])
  if cake
    cake.update(name: params[:name])
    return erb :index
  else
    halt 404
  end
end

# Destroy
post '/destroy/:id' do
  cake = Cake.find_by_id(params[:id])
  if cake
    cake.destroy
    return erb :index
  else
    halt 404
  end
end