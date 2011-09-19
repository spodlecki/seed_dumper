module SeedDumper

  # Dumper
  class Fetcher
    
    def self.fetch_data(klass, options={})
      ignore = ['created_at', 'updated_at']
      model_name = klass.name
      
      puts "Adding #{model_name.camelize} seeds."
      
      records = klass.all.map do |record| 
        attr_s = [];
      
        record.attributes.delete_if { |k, v| ignore.include?(k) }.each do |key, value|
          value = value.class == Time ? "\"#{value}\"" : value.inspect
          value = nil if value.is_a?(String) && value == "\"\""
          value = nil if value == 'nil' || value == "nil"

          unless value.nil?
            attr_s.push("#{key.to_sym.inspect} => #{value}")# unless key == 'id'
          end
        end
      
        "#{model_name.camelize}.create(#{attr_s.join(', ')})" 
      end
      # / records.each_with_index
      
      records
    end

  end
  
end