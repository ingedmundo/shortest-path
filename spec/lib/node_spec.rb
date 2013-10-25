require 'spec_helper'
require 'node'
require 'pry'

describe Node do

  subject { Node.new(1) }

  context 'default node values' do

    it 'should have an identifier' do
      expect(subject.id).to eql(1)
    end

    it 'default status is unvisited' do
      expect(subject.visited).to be_false
    end

    it 'can be set to visited' do
      subject.visited = true
      expect(subject.visited).to_not be_false
    end
  end

  context 'relations' do
    let(:node_2) { Node.new(2) }
    let(:node_3) { Node.new(3) }
    let(:node_6) { Node.new(6) }

    it 'you can add a related nodes' do
      expect(subject.add(node_2, 7)).to be_true
      expect(subject.add(node_3, 17)).to be_true
      expect(subject.add(node_6, 37)).to be_true
    end

    it 'can tell you who is his closest neighbour' do
      subject.add(node_2, 7)
      subject.add(node_3, 99)
      expect(subject.closest.id).to eql 2
    end

  end

end
