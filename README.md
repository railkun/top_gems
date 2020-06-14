# top_gems

This is lib to take a most popular gems on RubyGems

## Usage

  ```
  # If you don't have google chrome, you have to download it
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install ./google-chrome-stable_current_amd64.deb
  ```

  ```
  # If you don't have chromedriver, you have to download it
  sudo apt-get install chromium-chromedriver
  ```

  ```
  # Add ENV value
  export USER_NAME="EXAMPLEAWSACCESSRUBYGEMSUSERNAME"
  export USER_PASSWORD="EXAMPLEAWSACCESSRUBYGEMSPASSWORD"
  ```

  ```
  # Require app.rb to your rb file
  require_relative 'lib/top_gems'
  ```

  ```
  # Get an array of objects with top gems on RubyGems
  TopGems.run(page_count: count)
  ```

## Rubocop

  ```
  bundle exec rubocop
  ```
