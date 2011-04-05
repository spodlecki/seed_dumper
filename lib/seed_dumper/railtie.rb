require 'seed_dumper'
require 'rails'

module SeedDumper
  class Railtie < Rails::Railtie

    rake_tasks do
      load "tasks/seed_dumper.rake"
    end 

  end
end
