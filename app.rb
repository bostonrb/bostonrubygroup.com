require 'rubygems'
require 'sinatra'

set :public_folder, 'docs'

get '/' do
  File.read(File.join('docs', 'index.html'))
end
