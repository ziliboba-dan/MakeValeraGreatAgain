require 'rspec'
require_relative '../lib/model.rb'

RSpec.describe Model::GoWork do
    subject(:valerik) { Model::Valera.new(health, mana, fun, tired, money, alive) }
#subject(:gowork) { Model::GoWork.new }
    # subject(:watchnature) { Model::WatchNature.new }
    # subject(:drinkwine) { Model::DrinkWine.new }
    # subject(:gotobar) { Model::GoToBar.new }
    # subject(:drinkwmarginals) { Model::DrinkWithMarginals.new }
    # subject(:singinmetro) { Model::SingInMetro.new }
    # subject(:sleep) { Model::Sleep.new }

    describe 'Valera actions' do
        let(:health) { 100 }
        let(:mana) { 100 }
        let(:fun) { 100 }
        let(:tired) { 100 }
        let(:money) { 100 }
        let(:alive) { true }
        describe 'Go Work' do
            context 'go work without mana' do
                subject { Model::GoWork.new(valerik).change }
                let(:money) { -1 }
                it { expect { subject }.not_to change { valerik.health } }
                it { expect { subject }.to change { valerik.mana }.by(-20) }
                it { expect { subject }.to change { valerik.fun }.by(-5) }
                it { expect { subject }.to change { valerik.tired }.by(+50) }
                it { expect { subject }.to change { valerik.money }.by(+100) }
                it { expect { subject }.not_to change { valerik.alive } }
            end
            context 'go work with mana' do
                subject { Model::GoWork.new(valerik).change }
                it { expect { subject }.not_to change { valerik.health } }
                it { expect { subject }.not_to change { valerik.mana } }
                it { expect { subject }.not_to change { valerik.fun } }
                it { expect { subject }.not_to change { valerik.tired } }
                it { expect { subject }.not_to change { valerik.money } }
                it { expect { subject }.not_to change { valerik.alive } }
            end
        end
        context 'Watch Nature' do
            subject { Model::WatchNature.new(valerik).change }
            it { expect { subject }.not_to change { valerik.health } }
            it { expect { subject }.to change { valerik.mana }.by(-10) }
            it { expect { subject }.to change { valerik.fun }.by(+1) }
            it { expect { subject }.to change { valerik.tired }.by(+10) }
            it { expect { subject }.not_to change { valerik.money } }
            it { expect { subject }.not_to change { valerik.alive } }
        end
        context 'Drink Wine' do
            subject { Model::DrinkWine.new(valerik).change }
            it { expect { subject }.to change { valerik.health }.by(-5) }
            it { expect { subject }.to change { valerik.mana }.by(+30) }
            it { expect { subject }.to change { valerik.fun }.by(-1) }
            it { expect { subject }.to change { valerik.tired }.by(+10) }
            it { expect { subject }.to change { valerik.money }.by(-20) }
            it { expect { subject }.not_to change { valerik.alive } }
        end
        describe "Go to Bar" do
            context 'Go To Bar' do
                subject { Model::GoToBar.new(valerik).change }
                it { expect { subject }.to change { valerik.health }.by(-10) }
                it { expect { subject }.to change { valerik.mana }.by(+60) }
                it { expect { subject }.to change { valerik.fun }.by(+1) }
                it { expect { subject }.to change { valerik.tired }.by(+40) }
                it { expect { subject }.to change { valerik.money }.by(-100) }
                it { expect { subject }.not_to change { valerik.alive } }
            end
            context 'Go To Bar and die' do
                let(:health) { 10 }
                subject { Model::GoToBar.new(valerik).change }
                it { expect { subject }.to change { valerik.health }.by(-10) }
                it { expect { subject }.to change { valerik.mana }.by(+60) }
                it { expect { subject }.to change { valerik.fun }.by(+1) }
                it { expect { subject }.to change { valerik.tired }.by(+40) }
                it { expect { subject }.to change { valerik.money }.by(-100) }
                it { expect { subject }.to change { valerik.alive }.to(false) }
            end
        end
        context 'Drink With Marginals' do
            subject { Model::DrinkWithMarginals.new(valerik).change }
            it { expect { subject }.to change { valerik.health }.by(-80) }
            it { expect { subject }.to change { valerik.mana }.by(+90) }
            it { expect { subject }.to change { valerik.fun }.by(+5) }
            it { expect { subject }.to change { valerik.tired }.by(+80) }
            it { expect { subject }.to change { valerik.money }.by(-150) }
            it { expect { subject }.not_to change { valerik.alive } }
        end
        describe "Sing in Metro " do
            context 'Sing In Metro 40 < mana < 70' do
                let(:mana) { 50 }
                subject { Model::SingInMetro.new(valerik).change }
                it { expect { subject }.not_to change { valerik.health } }
                it { expect { subject }.to change { valerik.mana }.by(+10) }
                it { expect { subject }.to change { valerik.fun }.by(+1) }
                it { expect { subject }.to change { valerik.tired }.by(+20) }
                it { expect { subject }.to change { valerik.money }.by(+60) }
                it { expect { subject }.not_to change { valerik.alive } }
            end

            context 'Sing In Metro ' do
                subject { Model::SingInMetro.new(valerik).change }
                it { expect { subject }.not_to change { valerik.health } }
                it { expect { subject }.to change { valerik.mana }.by(+10) }
                it { expect { subject }.to change { valerik.fun }.by(+1) }
                it { expect { subject }.to change { valerik.tired }.by(+20) }
                it { expect { subject }.to change { valerik.money }.by(+10) }
                it { expect { subject }.not_to change { valerik.alive } }
            end
        end
        describe "Sleep " do
            context 'Sleep mana < 30 ' do
                let(:mana) { 20 }
                subject { Model::Sleep.new(valerik).change }
                it { expect { subject }.to change { valerik.health }.by(+90) }
                it { expect { subject }.to change { valerik.mana }.by(-50) }
                it { expect { subject }.not_to change { valerik.fun } }
                it { expect { subject }.to change { valerik.tired }.by(-70) }
                it { expect { subject }.not_to change { valerik.money } }
                it { expect { subject }.not_to change { valerik.alive } }
            end

            context 'Sleep mana > 70 ' do
                subject { Model::Sleep.new(valerik).change }
                it { expect { subject }.not_to change { valerik.health } }
                it { expect { subject }.to change { valerik.mana }.by(-50) }
                it { expect { subject }.to change { valerik.fun }.by(-3) }
                it { expect { subject }.to change { valerik.tired }.by(-70) }
                it { expect { subject }.not_to change { valerik.money } }
                it { expect { subject }.not_to change { valerik.alive } }
            end
        end
    end
end
