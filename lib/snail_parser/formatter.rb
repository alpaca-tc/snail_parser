module SnailParser
  class Formatter
    autoload :Json, 'snail_parser/formatter/json'
    autoload :Default, 'snail_parser/formatter/default'

    def initialize(result)
      @result = result
    end

    def report
      raise NotImplementedError
    end
  end
end
