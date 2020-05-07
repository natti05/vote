require 'sinatra'

get '/' do
  @greeting = 'welcome!'
  erb :index
end

post '/cast' do
  @greeting = 'Thank you for your vote!'
  @vote = params['vote']
  erb :cast
end

get '/results' do
  @vote = { 'HAM' => 7, 'PIZ' => 5, 'SUS' => 3 }
  erb :results
end

Options = {
  'HAM' => 'Hambúrger',
  'PIZ' => 'Pizza',
  'SUS' => 'Sushi',
  'LAM' => 'Lámen',
}
