namespace :db do
  namespace :seed  do
    desc 'Dump records from the database into db/seeds.rb'
    task :dump => :environment do
      Dir.glob(Rails.root + '/app/models/*.rb').each { |file| require file }
      models = Object.subclasses_of(ActiveRecord::Base)
      
      models.each { |model| SeedDumper::Writer.write_data(model.name, SeedDumper::Fetcher.fetch_data(model) ) }
    end
  end
end
# /db