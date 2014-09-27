RSpec.describe SnailParser::OptionParser do
  let(:option_parser) { described_class.new(argv) }

  describe '#parse!' do
    before do
      option_parser.parse!
    end

    let(:configuration) {  }

    shared_examples_for 'parsing option' do |key, value|
      subject { SnailParser.configuration[key] }

      context "given --#{key} option" do
        it "set #{key} to #{value}" do
          is_expected.to eql(value)
        end
      end
    end

    it_should_behave_like 'parsing option', :formatter, SnailParser::Formatter::Json do
      let(:argv) { %w(--formatter Json) }
    end

    it_should_behave_like 'parsing option', :path, 'path' do
      let(:argv) { %w(--path path) }
    end
  end
end
