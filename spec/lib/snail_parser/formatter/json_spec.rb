RSpec.describe SnailParser::Formatter::Json do
  let(:formatter) { described_class.new(result) }
  let(:result) do
    [
      {
        title: 'do_something2',
        status: 'Overdue',
        beginning_at: Date.new,
        completed_at: nil,
        time_spent: Time.new
      }
    ]
  end

  describe '#report' do
    subject { formatter.report }
    it 'report as json' do
      is_expected.to eq result.to_json
    end
  end
end
