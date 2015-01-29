source 'https://rubygems.org'

gemspec

# Database Configuration
group :development, :test do
  gem 'globalize',  github: 'globalize/globalize', branch: 'master'
  gem 'paper_trail', github: 'airblade/paper_trail', branch: 'master'
  gem 'friendly_id', github: 'norman/friendly_id', branch: 'master'
  gem 'rake'

  platforms :jruby do
    gem 'activerecord-jdbcsqlite3-adapter', '>= 1.3.0.beta2'
    gem 'jruby-openssl'
  end

  platforms :ruby do
    gem 'sqlite3'
  end

  gem 'pry'
  gem 'pry-nav'
end

