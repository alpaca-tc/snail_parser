RSpec.describe SnailParser::Parser do
  let(:csv) { spec_root.join('fixtures/test.csv') }

  describe 'ClassMethods' do
    describe '.parse' do
      subject { described_class.parse(csv) }

      it 'parse CSV' do
      end
    end
  end

  describe 'InstanceMethods' do
    let(:parser) { described_class.new(csv) }

    describe '#rows' do
      subject { parser.rows }

      it 'returns parsed CSV' do
        expect(subject.length).to eq 14

        first = subject.first
        expect(first[:title]).to eq 'do_something1'
        expect(first[:status]).to eq 'Overdue'
        expect(first[:beginning_at]).to be_a(Date)
        expect(first[:completed_at]).to be_nil
        expect(first[:time_spent]).to be_a(Time)
      end
    end
  end
end
