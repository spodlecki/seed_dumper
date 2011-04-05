module SeedDumper
  
  def dump_data(klass, options={})
    puts "Adding #{model_name.camelize} seeds."
    
    create_hash = ''
    records = klass.all
    
    records.each_with_index do |record, index| 
      attr_s = [];
    
      record.attributes.each do |key, value|
        value = value.class == Time ? "\"#{value}\"" : value.inspect
        attr_s.push("#{key.to_sym.inspect} => #{value}") unless key == 'id'
      end
    
      create_hash << (i > 0 ? ",\n" : "\n") << '  ' << '{ ' << attr_s.join(', ') << ' }'
    end
    # / records.each_with_index

    write_data("\n#{model_name.pluralize} = #{model_name.camelize}.create([#{create_hash}\n])\n")
  end
  
  
  def write_data(klass_name, data_string='')
    seed_file_name = "#{Rails.root}/db/seeds/#{klass_name}.rb"
    
    File.open(seed_file_name, 'w') do |f|
      puts "Writing #{seed_file_name}."
      f << data_string
    end
    
  end
  
end