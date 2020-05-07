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

Options = {
  'HAM' => 'Hambúrger',
  'PIZ' => 'Pizza',
  'SUS' => 'Sushi',
  'LAM' => 'Lámen',
}
