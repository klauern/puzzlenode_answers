
module Neo4jDbUtils
  def self.new_temp_db
    Neo4j::Config[:storage_path] = File.join(Dir.tmpdir, "cheap-and-fast-temp-db")
  end

  def self.rm_db_storage
    FileUtils.rm_rf Neo4j::Config[:storage_path]
  end
end
