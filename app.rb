require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'
require 'json'

set :database_file, 'config/database.yml'

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
  cake = Cake.find(params[:id])
  if cake
    cake.update(name: params[:name])
    return erb :index
  else
    halt 404
  end
end

# Destroy
post '/destroy/:id' do
  cake = Cake.find(params[:id])
  if cake
    cake.destroy
    return erb :index
  else
    halt 404
  end
end