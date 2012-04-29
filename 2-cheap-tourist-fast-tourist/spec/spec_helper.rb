require 'bundler/setup'
require 'minitest/spec'
require 'minitest/autorun'

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'neo4j'

# Because some of these tests are for me, not just my code... :P
def i str, &block
  it str, &block
end


Neo4j::Config[:storage_path] = File.join(Dir.tmpdir, "minispec_db")
FileUtils.rm_rf Neo4j::Config[:storage_path]

