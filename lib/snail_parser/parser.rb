require 'csv'
require 'time'

module SnailParser
  class Parser < CSV
    Column = {
      title: :string,
      status: :string,
      beginning_at: :date,
      completed_at: :date,
      time_spent: :time
    }.freeze

    def self.parse(path)
      new(path).rows
    end

    def initialize(path)
      CSV.open(path, 'r') do |f|
        f.shift # Remove header
        f.each { |row| rows << parse_row(row) }
      end
    end

    def rows
      @rows ||= []
    end

    private

    def parse_row(row)
      Column.each_with_object({}).with_index do |((key, type), result), index|
        result[key] = cast_type(row[index], type)
      end
    end

    def cast_type(value, type)
      return if value.nil?

      case type
      when :string
        value.to_s
      when :date
        Date.parse(value)
      when :time
        time_spent = Time.parse(value)
        Time.mktime(1, 1, 1, time_spent.hour, time_spent.min, time_spent.sec)
      else
        value
      end
    end
  end
end
