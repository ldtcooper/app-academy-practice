require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_line = params.map { |k, _v| "#{k} = ?" }.join(" AND ")
    search_terms = params.values
    result = DBConnection.execute(<<-SQL, search_terms)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_line}
    SQL
    parse_all(result)
  end
end

class SQLObject
  extend Searchable
end
