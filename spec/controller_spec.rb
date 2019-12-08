require 'rspec'
require_relative '../lib/controller.rb'


RSpec.describe Controller::Controller do
    subject(:control) { Controller::Controller.new(100, 0, 0, 0, 0, true).do_action(user_action) }
    describe 'action not exit' do
        context 'user_action = 1' do
            let(:user_action) { "1" }
            it { expect(subject).to eq false }
        end
        context 'user_action = 2' do
            let(:user_action) { "2" }
            it { expect(subject).to eq false }
        end
        context 'user_action = 3' do
            let(:user_action) { "3" }
            it { expect(subject).to eq false }
        end
        context 'user_action = 4' do
            let(:user_action) { "4" }
            it { expect(subject).to eq false }
        end
        context 'user_action = 5' do
            let(:user_action) { "5" }
            it { expect(subject).to eq false }
        end
        context 'user_action = 6' do
            let(:user_action) { "6" }
            it { expect(subject).to eq false }
        end
        context 'user_action = 7' do
            let(:user_action) { "7" }
            it { expect(subject).to eq false }
        end
        context 'user_action = l' do
            let(:user_action) { "l" }
            it { expect(subject).to eq false }
        end
    end
    describe 'action  exit' do    
        context 'user_action = q' do
            let(:user_action) { "q" }
            it { expect(subject).to eq true }
        end
        context 'user_action = 842342' do
            let(:user_action) { "842342" }
            it { expect(subject).to eq true }
        end
    end
end
