require 'snail_parser/option_parser'
require 'snail_parser/parser'
require 'snail_parser/formatter'
require 'snail_parser/version'

module SnailParser
  def self.invoke!
    OptionParser.new(ARGV).parse!
    run
  end

  def self.run
    result = Parser.parse(configuration[:path])
    configuration[:formatter].new(result).report
  end

  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= default_configuration
  end

  private

  def self.default_configuration
    {
      formatter: Formatter::Default
    }
  end
end
