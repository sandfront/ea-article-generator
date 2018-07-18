# require 'bundler'
# Bundler.require

require 'csv'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath = 'lib/assets/seeds.csv'

# Clear old articles
p "Clearing old articles"
Article.destroy_all
p "Cleared!"

CSV.foreach(filepath, csv_options) do |row|
  p Article.create(title: row[0], author: row[1], url: row[2])
end
