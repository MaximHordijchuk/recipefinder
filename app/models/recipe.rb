class Recipe
  include HTTParty

  key_value = ENV['FOOD2FORK_KEY']
  host_port = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'

  base_uri "http://#{host_port}/api/search"
  default_params key: key_value
  format :json

  def self.for(term)
    get('', query: {q: term})['recipes']
  end
end