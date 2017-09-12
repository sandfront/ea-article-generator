require 'bundler'
Bundler.require

# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("secrets/client_secret.json")

# Get the spreadsheet by its key. Select first worksheet.
spreadsheet = session.spreadsheet_by_key("17njnrWd-YQcXNkRJjA6aRmtLkoxyeMeldW6xXB3mEkk").worksheets[0]

Article.destroy_all

# Print out the first 6 columns of each row
spreadsheet.rows.drop(1).each do |row|
  p Article.create(title: row[0], author: row[1], url: row[2])
end
