class Module
  def create_finder_methods(*attributes)
    # Your code goes here!
    # Hint: Remember attr_reader and class_eval
    attributes.each do |field|
      new_method = %Q{
        def self.find_by_#{field}(argument)
          all = self.all()
          found = all.select{|item| item.#{field} == argument}
          if found.length > 0
            return found[0]
          else
            return nil
          end
        end
      }
      class_eval(new_method)
    end
  end
end
