require 'json'

class SnailParser::Formatter::Json < SnailParser::Formatter
  def report
    @result.to_json
  end
end
