module SeedDumper
  
  class Writer
    
    def self.write_data(klass_name, data_string='')
      seed_file_name = "#{Rails.root}/db/seeds/#{klass_name.tableize}.rb"
      
      File.open(seed_file_name, 'w') do |f|
        puts "Writing #{seed_file_name}."
        f << data_string
      end
      
    end
    
  end
  
  
end