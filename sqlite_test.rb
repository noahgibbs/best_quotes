require "sqlite3"
require "rulers/sqlite_model"

class MyTable < Rulers::Model::SQLite; end
STDERR.puts MyTable.schema.inspect

# Create row
mt = MyTable.create "title" => "I saw it again!"
mt["title"] = "I really did!"
mt.save!

mt2 = MyTable.find mt["id"]

puts "Title: #{mt2["title"]}"
