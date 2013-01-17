require 'test/unit'
require_relative 'ruby_focus_helper'

#Global variables
#--which should be used with extreme caution-- are available
#to use anywhere in your code. You can call them, change them
#at any point because their scope is global. Due to their
#accessibility, tracking bugs can be especially difficult.
#Since changes in a global variable change them everywhere,
#unintended side effects can easily spring up in your code.


class InsideClassGlobalVariable
  $glob_var = "accessible everywhere"

  def self.glob_var
    $glob_var
  end

  def glob_var
    $glob_var
  end
end

class InsideClassGlobalVariableTest < Test::Unit::TestCase
  def test_accessibility_from_global_scope
    assert_equal __, $global_var
  end

  def test_accessibility_in_class_method
    assert_equal __, InsideClassGlobalVariable.glob_var
  end

  def test_accessibility_in_instance_method
    new_object = InsideClassGlobalVariable.new
    assert_equal __, new_object.glob_var
  end
end


class MoreGlobalVariables
  def change_glob_var(str)
    $glob_var = str
  end
end


class MoreGlobalVariablesTest < Test::Unit::TestCase

  def test_glob_var_change
    object2 = MoreGlobalVariables.new
    assert_equal __, object2.change_glob_var("New Definition")
  end
end
