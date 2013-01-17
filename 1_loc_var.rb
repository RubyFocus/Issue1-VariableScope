require 'test/unit'
require_relative 'ruby_focus_helper'

# Local variables are only in scope within the context they were
# defined in e.g. blocks, methods, classes (which can be considered
# a block). Once you leave the current context either by entering a
# new block or exiting the current block, local variables are no longer
# available.

class LearnLocalVariableScope < Test::Unit::TestCase

  def test_in_scope_local_variable
    scope = "The context in which a variable is defined."

    assert_equal scope, __
  end


  def test_out_of_scope_local_variable
    out_of_scope = "What error gets raised when a variable is out of scope?"

    assert_raise(__) do
      class << self
        # class << self changes the scope of a block
        # so that the local variable that normally would
        # be in scope is out of scope for the sake
        # of this example.
        out_of_scope
      end
    end
  end
end

class LearnHowMethodsEffectScope < Test::Unit::TestCase

  def test_local_variables_defined_within_methods

    def access_an_out_of_scope_local_variable
      scope_of_methods = "Local variables defined within a method are in scope only in that method"
      assert_equal "Local variables defined within a method are in scope only in that method", __
    end

    access_an_out_of_scope_local_variable
  end

  def test_methods_as_scope_gates_for_local_variables_defined_outside_method
    defined_outside_the_method = "The def and end keywords represent a change of scope (a.k.a a scope gate)."

    def access_an_out_of_scope_local_variable
      puts defined_outside_the_method
    end

    assert_raise(__) {access_an_out_of_scope_local_variable}
  end

  def test_methods_as_scope_gates_for_local_variables_defined_inside_method

    def access_an_out_of_scope_local_variable
      defined_inside_the_method = "This is a local variable only in the method scope."
    end

    assert_raise(__) {defined_inside_the_method}
  end

end

# Classes as scope gates
class OutsideScopeLocalVariables

  x = "inside class but outside method"

  class InsideScopeLocalVariables

    z = "inside inner class but outside method"

    class InsideScopeLocalVariablesTest < Test::Unit::TestCase
      #Which will not be nil. Remember the scope.
      #If a variable isn't defined it should raise a NameError
      def test_scope_of_local_variables_in_inner_class
        y = "inside method"
        assert_raise(__) {raise x }
        assert_raise(__) {raise z }
        assert_equal __, y
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


# Blocks as scope gates

class BlocksAsScopeGates < Test::Unit::TestCase

  def test_scope_of_blocks
    numbers = 1..10
    numbers.each do |number|
      number += number
    end

  assert_raise(__) {number}
  end

  def test_accessibility_of_variables_in_blocks_declared_outside_of_blocks
    numbers = 1..10
    number_count = 0
    numbers.each do |number|
      number_count += number
    end

  assert_equal __, number_count
  end

end



