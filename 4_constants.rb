require 'test/unit'
require_relative 'ruby_focus_helper'

# Constant variables, like global variables, can be accessed
# from anywhere. The defining characteristic of a Constant
# variable is that it begins with an UPPERCASE variable. The
# name “constant” is actually a bit misleading because constant
# variables can be reassigned, although Ruby will throw you a
# warning if you do so. We call this Syntatic Vinegar, which
# means Ruby will try you to dissuade you --but not stop you--
# from using best practices.

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
