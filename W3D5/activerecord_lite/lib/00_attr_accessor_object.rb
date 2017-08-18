class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |variable|
      # getter
      define_method(variable) do
        instance_variable_get(variable)
      end

      #setter
      define_method("#{variable}=") do |new_val|
        instance_variable_set(variable, new_val)
      end
    end
  end
end

# def local_var
#   @local_var
# end
#
# def local_var=(new_val)
#   @local_var = new_val
# end
