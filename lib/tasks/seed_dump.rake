namespace :db do
  namespace :seed  do
    desc 'Dump records from the database into db/seeds.rb'
    task :dump => :environment do

      seed_rb = ""
      models = ActiveRecord::Base.send(:subclasses)
      
      models.sort{ |a,b| a.name <=> b.name }.each do |model|
        model_name  = model.name
        
        puts "Adding #{model_name.camelize} seeds."
        
        create_hash = ''
        records = []
        records = model.all if model.respond_to?(:all)
        
        records.each_with_index do |r,i| 
          attr_s = [];
        
          r.attributes.each do |k,v|
            v = v.class == Time ? "\"#{v}\"" : v.inspect
            attr_s.push("#{k.to_sym.inspect} => #{v}") unless k == 'id'
          end
        
          create_hash << (i > 0 ? ",\n" : "\n") << '  ' << '{ ' << attr_s.join(', ') << ' }'
        end
        # / arr.each_with_index

        seed_rb << "\n#{model_name.pluralize} = #{model_name.camelize}.create([#{create_hash}\n])\n"
      end
      # /models.sort.each
    
      File.open("#{Rails.root}/db/seed_dump.rb", 'w') do |f|
        puts "Writing #{Rails.root}/db/seed_dump.rb."
        f << seed_rb
      end
  
    end
  end
end
# /db