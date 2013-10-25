require 'spec_helper'
require 'node'

describe Node do

  subject { Node.new(1) }

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
