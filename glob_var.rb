require 'test/unit'

class InsideClassGlobalVariable

  $glob_var = "accessible everywhere"

  def self.glob_var
    $glob_var
  end

  def glob_var
    $glob_var
  end
end

# it'd be nice to see $global_vars

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




