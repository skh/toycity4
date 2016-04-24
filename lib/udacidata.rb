require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata

  @@data_path = File.dirname(__FILE__) + "/../data/data.csv"

  def self.create(attributes = nil)
    if attributes[:id]
      id = attributes[:id].to_i
      item = read(id)
      puts item.to_s
      return item unless item is nil
    end
    item = self.new (attributes)
    self.save (item)
    return item
  end

  private

  def self.read(id)
    CSV.open(@@data_path, "wb") do |csv|
    end
    return nil
  end

  def self.save(item)
    CSV.open(@@data_path, "ab") do |csv|
      csv << ["#{item.id}", "#{item.brand}", "#{item.name}", "#{item.price}"]
    end
  end


end
