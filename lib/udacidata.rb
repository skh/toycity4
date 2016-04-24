require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata

  create_finder_methods :brand, :name

  @@data_path = File.dirname(__FILE__) + "/../data/data.csv"

  def self.create(attributes = nil)
    if attributes[:id]
      id = attributes[:id].to_i
      item = find(id)
      return item unless item == nil
    end
    item = self.new (attributes)
    self.save (item)
    return item
  end

  def self.all
    all = []
    rows = CSV.read(@@data_path)
    (1..rows.length - 1).each do |i|
      all << self.new({id: rows[i][0], brand: rows[i][1], name: rows[i][2], price: rows[i][3]})
    end
    return all
  end

  def self.first(n=1)
    if n == 1
      return self.all[0]
    else
      return self.all[0,n]
    end
  end

  def self.last(n=1)
    if n == 1
      return self.all[-1]
    else
      return self.all[-1-n, n]
    end
  end

  def self.find(id)
    rows = CSV.read(@@data_path)
    (1..rows.length - 1).each do |i|
      if rows[i][0].to_i == id
        return self.new({id: rows[i][0], brand: rows[i][1], name: rows[i][2], price: rows[i][3]})
      end
    end
    return nil
  end

  def self.destroy(id)
    item = self.find(id)
    if item
      items = self.all()
      items.delete_if {|item| item.id == id }
      self.save_all(items)
      return item
    end
    return nil
  end

  private

  def self.save(item)
    CSV.open(@@data_path, "ab") do |csv|
      csv << ["#{item.id}", "#{item.brand}", "#{item.name}", "#{item.price}"]
    end
  end

  def self.save_all(items)
    CSV.open(@@data_path + ".tmp", 'ab') do |csv|
      csv <<  ["id", "brand", "product", "price"]
      items.each do |item|
        csv << ["#{item.id}", "#{item.brand}", "#{item.name}", "#{item.price}"]
      end
    end
    File.rename(@@data_path + ".tmp", @@data_path)
  end
end


