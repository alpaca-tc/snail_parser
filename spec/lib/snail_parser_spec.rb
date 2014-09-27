RSpec.describe SnailParser do
  before do
    SnailParser.instance_variable_set(:@configuration, nil)
  end

  describe '.configuration' do
    subject { described_class.configuration }
    it 'returns configuration' do
      is_expected.to eq(formatter: SnailParser::Formatter::Default)
    end
  end

  describe '.configure' do
    before do
      described_class.configure do |config|
        config[:path] = path
      end
    end
    let(:path) { 'path' }

    it 'set path to configuration' do
      expect(described_class.configuration[:path]).to eq(path)
    end
  end
end
