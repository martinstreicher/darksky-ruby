require 'rspec'
require 'darksky'
require 'timecop'
require 'vcr'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = false
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :typhoeus
end
