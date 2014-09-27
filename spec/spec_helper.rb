require 'rspec'
require 'pry'

begin
  require 'coveralls'
  Coveralls.wear!
rescue LoadError
end

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'snail_parser'

Dir[File.expand_path('../support', __FILE__) + '/**/*.rb'].each do |f|
  require f
end

def spec_root
  Pathname.new(__dir__)
end

RSpec.configure do |config|
  config.order = 'random'
  config.run_all_when_everything_filtered = true
  config.raise_errors_for_deprecations!
end
