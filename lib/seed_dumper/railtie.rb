require 'seed_dumper'
require 'rails'

module SeedDumper
  class Railtie < Rails::Railtie

    rake_tasks do
      SeedDumper.load_tasks
    end 

  end
end
