require 'sinatra'

get '/' do
  main = 
  "<ol>
    <% file = File.open('cake.list') %>
    <% file_data = file.readlines.map(&:chomp) %>
    <% file_data.each do |x| %>
        <li><%= x %></li>
    <% end %>
  </ol>"
  erb main
end
