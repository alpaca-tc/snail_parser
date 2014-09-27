require 'snail_parser'

RSpec.describe 'SnailParser::Version' do
  subject { SnailParser::Version }
  it { is_expected.to match(/\d+\.\d+\.\d+/) }
end
