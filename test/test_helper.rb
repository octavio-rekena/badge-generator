require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'minitest/mock'
require 'webmock/minitest'
require 'rails/test_help'
require 'minitest/autorun'

module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest
    with.library :rails
  end
end
