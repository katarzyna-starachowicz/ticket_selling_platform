source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.3'
gem 'sqlite3'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'puma', '~> 4.3'

gem 'responders'
gem 'dry-types'
gem 'dry-struct'
gem 'dry-validation'

gem 'sidekiq'

group :development, :test do
  gem 'byebug', platforms: %I[mri mingw x64_mingw]
  gem 'rubocop', '~> 0.70.0', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails', '~> 3.8'
  gem 'database_cleaner'
end
gem 'tzinfo-data', platforms: %I[mingw mswin x64_mingw jruby]
