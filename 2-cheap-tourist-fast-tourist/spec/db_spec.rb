require 'pry'
require_relative 'spec_helper'
require_relative '../lib/graph/db'
require_relative '../lib/graph/db_utils'

describe "multiple databases per test set" do

  before do
    Neo4jDbUtils.new_temp_db
    Neo4j::Node.index(:name)
  end

  after do
    Neo4j.shutdown
    Neo4jDbUtils.rm_db_storage
  end

  it "should keep neo4j databases separate" do
    tx = Neo4j::Transaction.new
    Neo4j::Node.new(:name => 'nick k')
    tx.success
    tx.finish
    Neo4j.shutdown
    Neo4jDbUtils.rm_db_storage
    Neo4j::Node.ref_node.must_be_nil
  end

  it "should create a node" do
    tx = Neo4j::Transaction.run {
    Neo4j::Node.new(name: 'nick k')
    }
    Neo4j.shutdown
    Neo4j::Node.find('name: "nick k"').first.wont_be_nil
    Neo4jDbUtils.rm_db_storage
  end

end
