require 'bundler'
Bundler.require

require 'json'
require 'rest-client'
require 'uri/http'

require 'jsonpath'
require 'json_expressions/rspec'
require 'csv-diff'
require 'csv'

World(JsonExpressions::RSpec::Matchers)

Before do
  @api_url = Settings.settings['api_url'].to_s.chomp('/')

  # RestClient.log = './restclient.log'
  puts PropLoader.get_props if ENV['DEBUG']

  # temp storage for values between step calls
  @values = {}

  # request defaults
  @method = :get
  @params = {}
  @headers = {
      :accept => :json
  }
end
