source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby                             "3.2.2"
gem "rails",                     "~> 7.1.2"
gem "sassc-rails"
gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "puma",                      ">= 5.0"
gem "bootsnap", require: false
gem "bootstrap-sass"
gem "sqlite3",                   "~> 1.4"
gem "bcrypt"
gem "faker"
gem "will_paginate",             "3.3.1"
gem "bootstrap-will_paginate",   "1.0.0"
gem 'image_processing'
gem "active_storage_validations"
gem 'jp_prefecture' #都道府県

group :production do
  gem "aws-sdk-s3", "1.114.0", require: false
end

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem "solargraph"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers",               "5.2.0"
  gem "rails-controller-testing", "1.0.5"
  gem "minitest",                 "5.18.0"
  gem "minitest-reporters",       "1.6.0"
  gem "guard",                    "2.18.0"
  gem "guard-minitest",           "2.4.6"

end

# Windows ではタイムゾーン情報用の tzinfo-data gem を含める必要があります
# gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
