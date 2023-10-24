# frozen_string_literal: true

require_relative 'lib/acts_as_has_many/version'

Gem::Specification.new do |spec|
  spec.name = 'acts_as_has_many'
  spec.version = ActsAsHasMany::VERSION
  spec.authors = ['Pralish Kayastha']
  spec.email = ['pralishkayastha@gmail.com']

  spec.summary = 'A Ruby gem that allows you to treat JSONB arrays as Active Record associations.'
  spec.description = 'acts_as_has_many is a gem that makes it easy to work with JSONB arrays as Active Record associations in your Ruby on Rails applications. It simplifies nested form handling.'
  spec.homepage = 'https://github.com/pralish/acts_as_has_many'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org' # Use the official RubyGems host

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/pralish/acts_as_has_many'
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '>= 6.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'appraisal', '~> 2.1'
  spec.add_development_dependency 'coveralls_reborn'
  spec.add_development_dependency 'simplecov-lcov'
end
