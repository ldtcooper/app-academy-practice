require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if @columns.nil?
      table = table_name
      columns = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{table}
      SQL
      @columns = columns.first.map(&:to_sym)
    end
    @columns
  end

  def self.finalize!
    self.columns.each do |col|

      #getter
      define_method(col) do
        self.attributes[col]
      end

      #setter
      define_method("#{col}=") do |new_val|
        self.attributes[col] = new_val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    if @table_name.nil?
      class_name = self.to_s
      class_name_arr = class_name.split(/(?=[A-Z])/)
      @table_name = "#{class_name_arr.join('_').downcase}s"
    end
    @table_name
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    self.class.columns
    params.each do |k, v|
      raise "unknown attribute '#{k}'" unless self.class.columns.include?(k)
      self.send("#{k}=".to_sym, v)
    end
  end

  def attributes
    @attributes ||= {}
    @attributes
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
