require 'spec_helper'
require 'gitsh/tab_completion/matchers/anything_matcher'

describe Gitsh::TabCompletion::Matchers::AnythingMatcher do
  describe '#match?' do
    it 'returns true for all input' do
      matcher = described_class.new(double(:env))

      expect(matcher.match?('foo')).to be_truthy
      expect(matcher.match?('--all')).to be_truthy
      expect(matcher.match?('')).to be_truthy
    end
  end

  describe '#completions' do
    it 'returns an empty array' do
      matcher = described_class.new(double(:env))

      expect(matcher.completions('foo')).to eq([])
      expect(matcher.completions('--all')).to eq([])
      expect(matcher.completions('')).to eq([])
    end
  end

  describe '#eql?' do
    it 'returns true when given another instance of the same class' do
      matcher1 = described_class.new(double(:env))
      matcher2 = described_class.new(double(:env))

      expect(matcher1).to eql(matcher2)
    end

    it 'returns false when given an instance of any other class' do
      matcher = described_class.new(double(:env))
      other = double(:not_a_matcher)

      expect(matcher).not_to eql(other)
    end
  end

  describe '#hash' do
    it 'returns the same value for all instances of the class' do
      matcher1 = described_class.new(double(:env))
      matcher2 = described_class.new(double(:env))

      expect(matcher1.hash).to eq(matcher2.hash)
    end
  end
end
