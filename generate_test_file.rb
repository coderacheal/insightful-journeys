require 'fileutils'

test_folder_path = 'C:/Users/rache/OneDrive/GitHub/insightful-journeys/test'

# Create the test folder
FileUtils.mkdir_p(test_folder_path)

# Optionally, create subfolders within the test folder
FileUtils.mkdir_p(File.join(test_folder_path, 'system'))

puts "Test folder generated successfully."
