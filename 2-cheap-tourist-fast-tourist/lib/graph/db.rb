require 'neo4j'
require_relative 'db_utils'

# Create database

Neo4j::Config[:storage_path] = "#{File.dirname(__FILE__)}/../../db"

