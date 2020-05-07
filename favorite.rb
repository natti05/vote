require 'sinatra'
require 'yaml/store'

get '/' do
  @greeting = 'welcome!'
  erb :index
end

post '/cast' do
  @greeting = 'Thank you for your vote!'
  @vote = params['vote']
  @store = YAML::Store.new 'vote.yml'
  @store.transaction do
    @store['vote'] ||= {}
    @store['vote'][@vote] ||= 0
    @store['vote'][@vote] += 1
  end
  erb :cast
end

get '/results' do
  @greeting = 'Results till now:'
  @store = YAML::Store.new 'vote.yml'
  @vote = @store.transaction { @store['vote'] }
  erb :results
end

Options = {
  'HAM' => 'Hamburger',
  'PIZ' => 'Pizza',
  'SUS' => 'Sushi',
  'LAM' => 'Lamen',
}
