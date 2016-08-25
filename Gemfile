source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use mysql as the database for Active Record
gem 'mysql2', '0.3.18'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# gem 'jquery-turbolinks'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # For test
  gem "rspec-rails"         #Rails 専用の機能を追加するRSpecのラッパーライブラリ
  gem "factory_girl_rails"  #テストデータを作成する
  gem "faker"
end

# For Test env
group :test do
  gem "capybara"            #ユーザーとWebアプリケーションのやり取りをプログラム上で簡単にシュミレートを可能にする
  gem "database_cleaner"    #データベースをまっさらな状態で各specが実行できるようにする
  gem "launchy"             #テストのデバック用
  gem "poltergeist"         #capybaraのためのドライバ
end

# Add Haml
gem 'haml-rails'
gem 'erb2haml'
gem 'bootstrap-sass'

# Add Devise
gem 'devise', '4.2.0'

# Add carrierwave
gem 'carrierwave'
gem 'rmagick'

# Add kaminari
gem 'kaminari'

# Add tag
gem 'acts-as-taggable-on', '~> 3.4'

# Add twitter-bootstrap
gem 'therubyracer'
gem 'less-rails'
gem 'twitter-bootstrap-rails'

# Add s3
gem 'fog'
gem 'config'
