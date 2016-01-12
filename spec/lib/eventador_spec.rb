RSpec.describe Eventador do
  describe '.configure' do
    let(:new_value) { FFaker::Lorem.word }
    let!(:old_value) { described_class.configuration.store }

    it 'allows to change config params' do
      expect { described_class.configure { |c| c.store = new_value } }
        .to change(described_class.configuration, :store).to(new_value)
    end

    after(:each) do
      described_class.configure { |c| c.store = old_value }
    end
  end

  describe '.tracker' do
    it 'returns instance of Tracker' do
      expect(described_class.tracker).to be_a(Eventador::Tracker)
    end
  end
end
