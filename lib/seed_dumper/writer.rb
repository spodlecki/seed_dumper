module SeedDumper
  
  class Writer
    
    def self.write_data(klass_name, records)
      FileUtils.mkdir("#{Rails.root}/db/seeds/") unless File.exist?("#{Rails.root}/db/seeds/")
      seed_file_name = "#{Rails.root}/db/seeds/#{klass_name.tableize}.rb"
      
      puts "Writing #{seed_file_name}."
      File.open(seed_file_name, 'w') do |f|
        records.each { |record| f.puts(record) }
      end
      
    end
    
  end
  
  
end