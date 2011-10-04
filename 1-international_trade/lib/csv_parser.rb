require 'csv'

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


