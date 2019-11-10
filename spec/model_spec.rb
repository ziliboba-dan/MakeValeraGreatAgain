require 'rspec'
require_relative '../lib/model.rb'

RSpec.describe Model::GoWork do
    subject(:valerik) { Model::Valera.new(health, mana, fun, tired, money, alive) }
    subject(:gowork) { Model::GoWork.new }
    subject(:watchnature) { Model::WatchNature.new }
    subject(:drinkwine) { Model::DrinkWine.new }
    subject(:gotobar) { Model::GoToBar.new }
    subject(:drinkwmarginals) { Model::DrinkWithMarginals.new }
    subject(:singinmetro) { Model::SingInMetro.new }
    subject(:sleep) { Model::Sleep.new }

    describe 'Valera actions' do
        let(:health) { 100 }
        let(:mana) { 100 }
        let(:fun) { 100 }
        let(:tired) { 100 }
        let(:money) { 100 }
        let(:alive) { true }
        describe 'Go Work' do
            context 'go work without mana' do
                let(:mana) { 10 }
                let(:tired) { 5 }
                it 'shoud be 100, 70, 95, 170, 200' do
                    gowork.change(valerik)
                    expect(valerik.health).to eq health
                    expect(valerik.mana).to eq mana - 30
                    expect(valerik.fun).to eq fun - 5
                    expect(valerik.tired).to eq tired + 70
                    expect(valerik.money).to eq money + 100
                    expect(valerik.alive).to eq true
                end
            end
            context 'go work with mana' do
                let(:mana) { 60 }
                it 'shoud be 100, 60, 100, 100, 100' do
                    gowork.change(valerik)
                    expect(valerik.health).to eq health
                    expect(valerik.mana).to eq mana
                    expect(valerik.fun).to eq fun
                    expect(valerik.tired).to eq tired
                    expect(valerik.money).to eq money
                    expect(valerik.alive).to eq true
                end
            end
        end
        context 'Watch Nature' do
            it 'shoud be 100, 60, 100, 5, 100' do
                watchnature.change(valerik)
                expect(valerik.health).to eq health
                expect(valerik.mana).to eq mana - 10
                expect(valerik.fun).to eq fun + 1
                expect(valerik.tired).to eq tired + 10
                expect(valerik.money).to eq money
                expect(valerik.alive).to eq true
            end
        end
        context 'Drink Wine' do
            it 'shoud be 100, 60, 100, 5, 100' do
                drinkwine.change(valerik)
                expect(valerik.health).to eq health - 5
                expect(valerik.mana).to eq mana + 30
                expect(valerik.fun).to eq fun - 1
                expect(valerik.tired).to eq tired + 10
                expect(valerik.money).to eq money - 20
                expect(valerik.alive).to eq true
            end
        end
        describe "Go to Bar" do
            context 'Go To Bar' do
                it 'shoud be 100, 60, 100, 5, 100' do
                    gotobar.change(valerik)
                    expect(valerik.health).to eq health - 10
                    expect(valerik.mana).to eq mana + 60
                    expect(valerik.fun).to eq fun + 1
                    expect(valerik.tired).to eq tired + 40
                    expect(valerik.money).to eq money - 100
                    expect(valerik.alive).to eq true
                end
            end
            context 'Go To Bar and die' do
                let(:health) { 10 }
                it 'shoud be 100, 60, 100, 5, 100' do
                    gotobar.change(valerik)
                    expect(valerik.health).to eq health - 10
                    expect(valerik.mana).to eq mana + 60
                    expect(valerik.fun).to eq fun + 1
                    expect(valerik.tired).to eq tired + 40
                    expect(valerik.money).to eq money - 100
                    expect(valerik.alive).to eq false
                end
            end
        end
        context 'Drink With Marginals' do
            it 'shoud be 100, 60, 100, 5, 100' do
                drinkwmarginals.change(valerik)
                expect(valerik.health).to eq health - 80
                expect(valerik.mana).to eq mana + 90
                expect(valerik.fun).to eq fun + 5
                expect(valerik.tired).to eq tired + 80
                expect(valerik.money).to eq money - 150
                expect(valerik.alive).to eq true
            end
        end
        describe "Sing in Metro " do
            context 'Sing In Metro 40 < mana < 70' do
                let(:mana) { 50 }
                it 'shoud be 100, 60, 100, 5, 100' do
                    singinmetro.change(valerik)
                    expect(valerik.health).to eq health
                    expect(valerik.mana).to eq mana + 10
                    expect(valerik.fun).to eq fun + 1
                    expect(valerik.tired).to eq tired + 20
                    expect(valerik.money).to eq money + 60
                    expect(valerik.alive).to eq true
                end
            end

            context 'Sing In Metro ' do
                it 'shoud be 100, 60, 100, 5, 100' do
                    singinmetro.change(valerik)
                    expect(valerik.health).to eq health
                    expect(valerik.mana).to eq mana + 10
                    expect(valerik.fun).to eq fun + 1
                    expect(valerik.tired).to eq tired + 20
                    expect(valerik.money).to eq money + 10
                    expect(valerik.alive).to eq true
                end
            end
        end
        describe "Sleep " do
            context 'Sleep mana < 30 ' do
                let(:mana) { 20 }
                it 'shoud be 100, 60, 100, 5, 100' do
                    sleep.change(valerik)
                    expect(valerik.health).to eq health + 90
                    expect(valerik.mana).to eq mana - 50
                    expect(valerik.fun).to eq fun
                    expect(valerik.tired).to eq tired - 70
                    expect(valerik.money).to eq money
                    expect(valerik.alive).to eq true
                end
            end

            context 'Sleep mana > 70 ' do
                it 'shoud be 100, 60, 100, 5, 100' do
                    sleep.change(valerik)
                    expect(valerik.health).to eq health
                    expect(valerik.mana).to eq mana - 50
                    expect(valerik.fun).to eq fun - 3
                    expect(valerik.tired).to eq tired - 70
                    expect(valerik.money).to eq money
                    expect(valerik.alive).to eq true
                end
            end
        end
    end
end
