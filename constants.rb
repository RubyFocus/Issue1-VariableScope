require 'test/unit'

RUBY_CONSTANT = "Practice"

class ConstantExercise

  RUBY_CONSTANT2 = "Only accessible inside of the class"

  def access_constant
    RUBY_CONSTANT
  end
end


class ConstantExerciseTest < Test::Unit::TestCase

  # Constant is available anywhere because it was defined in the "main" scope
  def test_accessibility_of_free_constant
    const = ConstantExercise.new
    assert_equal __, const.access_constant
  end

  # Cannot access outside of class because it was defined within the classes scope. Must be namespaced
  def test_accessibility_of_nested_constant_namespace
    assert_equal __, ConstantExercise::RUBY_CONSTANT2
  end

end