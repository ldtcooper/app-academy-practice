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
    all_items = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    self.parse_all(all_items)
  end

  def self.parse_all(results)
    objects_arr = []
    results.each do |hsh|
      objects_arr << self.new(hsh)
    end
    objects_arr
  end

  def self.find(id)
    found_record = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        id = ?
    SQL
    found_record.empty? ? nil : self.new(found_record.first)
  end

  def initialize(params = {})
    self.class.columns
    params.each do |k, v|
      unless self.class.columns.include?(k.to_sym)
        raise "unknown attribute '#{k}'"
      end
      self.send("#{k}=".to_sym, v)
    end
  end

  def attributes
    @attributes ||= {}
    @attributes
  end

  def attribute_values
    self.class.columns.map do |el|
      self.send(el)
    end
  end

  def insert
    cols = self.class.columns
    col_names = cols.join(", ")
    q_marks = (["?"] * cols.length).join(", ")
    DBConnection.execute(<<-SQL, attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{q_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    set_line = self.class.columns
    set_line = set_line.map { |col| "#{col} = ?" }.join(", ")
    DBConnection.execute(<<-SQL, attribute_values, self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        id = ?
    SQL
  end

  def save
    # ...
  end
end
