require 'test/unit'


class OutsideScopeLocalVariables

  x = "inside class but outside method"

  class InsideScopeLocalVariables

    z = "inside inner class but outside method"

    class InsideScopeLocalVariablesTest < Test::Unit::TestCase
      #Which will not be nil. Remember the scope.
      #If a variable isn't defined it should raise a NameError
      def test_scope_of_local_variables_in_inner_class
        y = "inside method"
        assert_raise(NameError) {raise x }
        assert_raise(NameError) {raise z }
        assert_equal "inside method", y
      end
    end
  end

  class OutsideScopeLocalVariablesTest < Test::Unit::TestCase
    #Uncomment the correct test. Remember Scope.

    def test_scope_of_local_variables_in_outside_class
      b = "local variable"
      # assert_raise(__) {raise b}
      assert_equal __, b

      assert_raise(__) {raise x} 
      # assert_equal __, x 

      assert_raise(__) {raise y}
      # assert_equal __, y

      assert_raise(__) {raise z}
      # assert_equal __, z
    end
  end
end



