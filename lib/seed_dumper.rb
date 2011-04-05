require 'seed_dumper/fetcher'
require 'seed_dumper/writer'

module SeedDumper
  require 'seedbank/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
end