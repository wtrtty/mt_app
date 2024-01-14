require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)

module MtApp
  class Application < Rails::Application
    config.i18n.default_locale = :ja  # デフォルトのローカルを日本語に設定
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))
    config.active_record.sqlite3_production_warning = false  #sqliteへの警告を無効
  end
end
