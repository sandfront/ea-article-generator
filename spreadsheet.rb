require 'bundler'
Bundler.require

# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("secrets/client_secret.json")

# Get the spreadsheet by its key. Select first worksheet.
spreadsheet = session.spreadsheet_by_key("17njnrWd-YQcXNkRJjA6aRmtLkoxyeMeldW6xXB3mEkk").worksheets[0]

# Print out the first 6 columns of each row
spreadsheet.rows.each { |row| puts row.first(6).join(" | ") }
