require 'rspec'
require_relative '../lib/adapter.rb'


RSpec.describe IOAdapter do
    subject(:adapter) { IOAdapter.write(str)}
    describe 'action not exit' do
        context 'when string' do
            let(:str) { "sdfg" }
            it { expect(subject).to eq str }
        end
    end
end
