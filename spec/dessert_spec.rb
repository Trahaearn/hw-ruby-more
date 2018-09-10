require 'dessert'
require 'byebug'
require 'rspec/its'

describe Dessert do
  describe 'cake' do
    subject { Dessert.new('cake', 400) }
    its(:calories) { should == 400 }
    its(:name)     { should == 'cake' }
    it { should be_delicious }
    it { should_not be_healthy }
  end
  describe 'apple' do
    subject { Dessert.new('apple', 75) }
    it { should be_delicious }
    it { should be_healthy }
  end
  describe 'can set' do
    before(:each) { @dessert = Dessert.new('xxx', 0) }
    it 'calories' do
      @dessert.calories = 80
      expect(@dessert.calories).to eq(80)
    end
    it 'name' do
      @dessert.name = 'ice cream'
      expect(@dessert.name).to eq('ice cream')
    end
  end
  describe 'prevents non-word characters in names' do
    it 'should remove non-word characters from the name' do
        @dessert = Dessert.new('#!$Flam!', 0)
        expect(@dessert.name).to eq('Flam')
    end
    it 'should remove numbers from the name' do
        @dessert = Dessert.new('9999 Muffin', 0)
        expect(@dessert.name).to eq('Muffin')
    end
  end
  describe 'prevents bad inputs' do
    it 'should raise argument if name is empty' do
        expect { Dessert.new('', 20) }.to raise_error(ArgumentError)
    end
    it 'should raise argument if calories are negative' do
        expect { Dessert.new('Weight Reduction', -2000) }.to raise_error(ArgumentError)
    end
  end
end

describe JellyBean do
  describe 'when non-licorice' do
    subject { JellyBean.new('vanilla') }
    its(:calories) { should == 5 }
    its(:name)     { should match /vanilla jelly bean/i }
    it             { should be_delicious }
  end
  describe 'when licorice' do
    subject { JellyBean.new('licorice') }
    it { should_not be_delicious }
  end
  describe 'can set' do
    before(:each) { @jellybean = JellyBean.new('xxx') }
    it 'flavor' do
      @jellybean.flavor = "Orange"
      expect(@jellybean.flavor).to eq("Orange")
    end
  end
  describe 'prevents non-word characters in flavor names' do
    it 'should remove non-word characters from the name' do
        @jellybean = JellyBean.new('#!$Peanut!')
        expect(@jellybean.flavor).to eq('Peanut')
    end
    it 'should remove numbers from the flavor name' do
        @jellybean = JellyBean.new('471Rum100')
        expect(@jellybean.flavor).to eq('Rum')
    end
  end
  describe 'handles empty inputs' do
    it 'should raise argument if flavor is empty' do
        expect { JellyBean.new('') }.to raise_error(ArgumentError)
    end
  end
end
