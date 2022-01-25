source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'aasm'
gem 'bootsnap', require: false
gem 'enumerize'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.1'
gem 'rails-patterns'
gem 'sqlite3'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
  gem 'rubocop', require: false
end
