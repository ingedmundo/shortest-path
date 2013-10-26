require 'spec_helper'
require 'graph'
require 'node'
require 'pry'

describe Graph do
  it 'user can add nodes' do
    node1 = Node.new 1

    expect(subject.add(node1)).to be_true
    expect(subject.nodes.count).to eql 1
  end


  it 'finds shortest distance to a node' do
    #Nodes
    node_1 = Node.new 1
    node_2 = Node.new 2
    node_3 = Node.new 3
    node_4 = Node.new 4
    node_5 = Node.new 5
    node_6 = Node.new 6

    #Relations
    node_1.add node_2, 7
    node_1.add node_3, 9
    node_1.add node_6, 14

    node_2.add node_1, 7
    node_2.add node_3, 10
    node_2.add node_4, 15

    node_3.add node_1, 9
    node_3.add node_2, 10
    node_3.add node_4, 11
    node_3.add node_6, 2

    node_4.add node_5, 6
    node_4.add node_3, 11
    node_4.add node_2, 15

    node_5.add node_4, 6
    node_5.add node_6, 9

    node_6.add node_1, 14
    node_6.add node_3, 2
    node_6.add node_5, 9

    subject.add node_1
    subject.add node_2
    subject.add node_3
    subject.add node_4
    subject.add node_5
    subject.add node_6

    expect(subject.shortest_path_to(5)).to eql 20
  end
end
