module Extensions
  # Extensions are a contrived set of extension methods, for experimentation purposes only.
  module Array
    def self.included(base)
      base.instance_eval do
        include InstanceMethods
      end
    end
    module InstanceMethods
      # Array#intersects - Returns a new array of unique elements shared between the two arrays.
      #   [1,1,2,3,3,3,4].instersects [1,2,3,18,24] # => [1,2,3]
      # ---
      # The obvious answer...
      def intersects_with_select(ary)
        select { |item| ary.include?(item) }.compact.uniq
      end
      
      # Another obvious answer, though a little slower with larger datasets
      def intersects_with_collect(ary)
        collect { |item| item if ary.include?(item) }.compact.uniq
      end
      
      # Let's use a while loop for some speed
      def intersects_with_while(ary)
        # The working arrays
        a1, a2, store = self.sort, ary.sort, []
        # Indices starting points
        i, j = 0, 0
        while i < a1.length && j < a2.length
          if a1[i] == a2[j]
            store << a1[i]
            i += 1
            j += 1
          elsif a1[i] < a2[j]
            i += 1
          else
            j += 1
          end
        end
        store.uniq
      end
      
      # And maybe try a for loop as well, why not
      def intersects_with_for(ary)
        store = []
        if size > ary.length then
          a1 = self
          a2 = ary
        else
          a1 = ary
          a2 = self
        end
        for i in 0..a1.size
          store << a1[i] if a2.include?(a1[i])
        end
        store.uniq
      end
      
      # `intersects_with_while` seems to be the fastest alternative, so let's use it by default
      alias_method :intersects, :intersects_with_while
    end
  end
end
Array.send(:include, Extensions::Array)
