source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Content CMS
gem 'contentful', '~> 2.16'

# CSS framework
gem 'bootstrap', '~> 4.6'

# haml layout
gem 'haml', '~> 5.2'

# MD to html parser
gem 'kramdown', '~> 2.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
end

group :test do
  gem 'rspec', '~> 3.10'
  gem 'rspec-rails', '~> 5.0'
  gem 'rails-controller-testing'
  gem 'vcr', '~> 6.0'
  gem 'webmock', '~> 3.12'
  gem 'simplecov', '~> 0.12'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
