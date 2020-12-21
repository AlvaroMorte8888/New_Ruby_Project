ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!


class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  #  Настроить все точки входа в test/fixtures/*.yml для всех тестов в алфавитном порядке. fixtures :all
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
