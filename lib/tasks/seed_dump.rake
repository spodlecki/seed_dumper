namespace :db do
  namespace :seed  do
    desc 'Dump records from the database into db/seeds.rb'
    task :dump => :environment do
      models = ActiveRecord::Base.send(:subclasses)
      models.each { |model| SeedDumper.dump_data(model) }
    end
  end
end
# /db