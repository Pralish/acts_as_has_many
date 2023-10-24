# frozen_string_literal: true

require 'simplecov'

if ENV['GITHUB_ACTIONS']
  require 'simplecov-lcov'

  SimpleCov::Formatter::LcovFormatter.config do |c|
    c.report_with_single_file = true
    c.single_report_path = 'coverage/lcov.info'
  end
  SimpleCov.formatter = SimpleCov::Formatter::LcovFormatter
end

SimpleCov.start

require 'coveralls'

Coveralls.wear!

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.filter_run_including focus: true
  config.run_all_when_everything_filtered = true
end
