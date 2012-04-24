require 'neo4j'

# Create database

Neo4j::Config[:storage_path] = "#{File.dirname(__FILE__)}/../../db"
