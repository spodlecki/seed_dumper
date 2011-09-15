require 'rake' unless defined?(Rake)
require 'rails' unless defined?(Rails)

module SeedDumper
  VERSION = '0.1.1'
  autoload :Fetcher, 'seed_dumper/fetcher'
  autoload :Writer, 'seed_dumper/writer'
  require 'seed_dumper/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
end


