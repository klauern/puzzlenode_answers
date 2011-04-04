if RUBY_VERSION =~ /1.8/
  require 'fastercsv'
  CSV = FasterCSV # Ruby 1.9 uses FasterCSV as the CSV parser, so we just alias it for 1.8 to make things easier.
else
  require 'csv'
end


class CsvTransactionParser

  def initialize(filename)
    @arrs = parse(filename)
  end

  def parse(filename)
    CSV.read(filename)
  end

  def retrieve_skus(sku)
    @arrs.select { |ary| ary[1] == sku }
  end

  def retrieve_stores(store)
    @arrs.select { |ary| ary[0] == store }
  end

  def retrieve_trans(store_name)
    ars = retrieve_stores(store_name)
    ars.map { |a| a[2] }
  end

end


