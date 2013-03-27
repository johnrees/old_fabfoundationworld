# encoding: UTF-8

require 'localeapp/rails'

Localeapp.configure do |config|
  config.api_key = ENV['LOCALEAPP_API_KEY']
end

$locales = {
  en: "English",
  es: "Español",
  pt: "Português"
}
