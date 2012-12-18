require "sqlite3"
require "rulers/sqlite_model"

class MyTable < Rulers::Model::SQLite; end
STDERR.puts MyTable.schema.inspect

# Create row
mt = MyTable.create "title" => "It happened!",
  "posted" => 1, "body" => "It did!"
mt = MyTable.create "title" => "I saw it!"

puts "Count: #{MyTable.count}"
