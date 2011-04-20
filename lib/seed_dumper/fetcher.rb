module SeedDumper

  # Dumper
  class Fetcher
    
    def self.fetch_data(klass, options={})
      model_name = klass.name
      
      puts "Adding #{model_name.camelize} seeds."
      
      create_hash = ''
      records = klass.all
      
      records.each_with_index do |record, index| 
        attr_s = [];
      
        record.attributes.each do |key, value|
          value = value.class == Time ? "\"#{value}\"" : value.inspect
          
          value = nil if value.is_a?(String) && value == "\"\""
          value = nil if value == 'nil' || value == "nil"

          unless value.nil?
            attr_s.push("#{key.to_sym.inspect} => #{value}") unless key == 'id'
          end
        end
      
        create_hash << (index > 0 ? ",\n" : "\n") << '  ' << '{ ' << attr_s.join(', ') << ' }'
      end
      # / records.each_with_index
      
      return "\n#{model_name.camelize}.create([#{create_hash}\n])\n"
    end

  end
  
end