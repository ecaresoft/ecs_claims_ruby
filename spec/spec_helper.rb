require File.expand_path('../../lib/ecs_claims', __FILE__)
require 'rspec'
require 'webmock/rspec'
require 'vcr'
require 'pry'

TOKEN = 'a3d1bb0e297953'
URL = 'http://localhost'
RFC = 'SIFUBAR'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures'
  c.hook_into :webmock
  c.default_cassette_options = { match_requests_on: [:method] }
  c.configure_rspec_metadata!
end
