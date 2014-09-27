require 'optparse'

module SnailParser
  class OptionParser
    def initialize(argv)
      @original_argv = argv.dup
      @argv = argv
    end

    def parse!
      option_parser.parse!(@argv)
    end

    private

    def option_parser
      @option_parser ||= ::OptionParser.new do |parser|
        parser.on('--path PATH') do |path|
          SnailParser.configuration[:path] = path
        end

        parser.on('--formatter FORMATTER') do |klass|
          # SnailParser.configuration[:formatter] = Formatter.const_get(klass)
          SnailParser.configuration[:formatter] = Formatter::Json
        end

        parser.on_tail('-h', '--help', 'Show this usage message and quit.') do |setting|
          puts parser.help
          exit
        end

        parser.on_tail('-v', '--version', 'Show version information about tamago and quit.') do
          puts SnailParser::Version
          exit
        end
      end
    end
  end
end
