require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module MooveItInventory

  class Application < Rails::Application
    config.i18n.default_locale = :en
  end

end