require 'sinatra'
require 'httparty'
require 'erb'

if ENV['SSRFPASSWORD']
  pass = ENV['SSRFPASSWORD']
else
  pass = 'ssrftester'
end

#Need to listen on all interfaces
set :bind, '0.0.0.0'

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == 'ssrftester' and password == pass
end


get '/' do
  erb :hello_form
end

get '/getter_form/' do
  erb :getter_form
end

get '/poster_form/' do
  erb :poster_form
end

post '/geturl/' do
  output = ''
  output << params[:url]
  output << "<br>-----------------<br><br><br>"
  response = HTTParty.get(params[:url])
  output << ERB::Util.html_escape(response.body)
  output
end

post '/posturl/' do
  output = ''
  output << "URL : " + params[:url] + " :: Params : " + params[:postdata]
  output << "<br>-----------------<br><br><br>"
  response = HTTParty.post(params[:url], body: params[:postdata])
  output << ERB::Util.html_escape(response.body)
  output
end

get '/getter/:url' do
  output = ''
  output << URI.decode(params[:url])
  output << "<br>-----------------<br><br><br>"
  response = HTTParty.get(URI.decode(params[:url]))
  output << ERB::Util.html_escape(response.body)
  output
end

