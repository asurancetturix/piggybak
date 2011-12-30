module Piggybak
  module ActsAsProduct
    ## Define ModelMethods
    module Base
      def self.included(klass)
        klass.class_eval do
          extend ClassMethods
        end
      end
      
      module ClassMethods
        def acts_as_product
          has_one :piggybak_product, :as => "item", :class_name => "::Piggybak::Product"

          accepts_nested_attributes_for :piggybak_product, :allow_destroy => true
          
          include Piggybak::ActsAsProduct::Base::InstanceMethods
        end
      end
      
      module InstanceMethods
        
        def factory_name
          "this is an example instance method"
        end
                
      end # InstanceMethods      
    end
  end
end

::ActiveRecord::Base.send :include, Piggybak::ActsAsProduct::Base
