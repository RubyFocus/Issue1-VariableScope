require 'test/unit'
require_relative 'ruby_focus_helper'

# Class variables, which always begin with “@@”,  are defined within
# the class and are accessible to all instances of that class as well
# as any class that inherits from them. In the following example, we
# define a global variable in the Person class and then create a reader
# method to call the class variable.

# 

class People 
  @@country = "Brazil"
end

class Person < People

  def initialize(country)
    @country = country
  end

  def country
    @country
  end
end

class ClassVariableInheritance < Test::Unit::TestCase

  def test_that_class_variables_are_inherited
    assert_equal Person.class_variable_get(:@@country), __
  end

  def test_that_class_variables_are_different_from_instance_variables
    bob = Person.new("USA")

    assert_equal bob.country, __
  end
end



class Human 
  @@foodgroup = "Vegetables"
end


class Zombie < Human
  @@foodgroup = "Flesh"
end

class ChangingSubclassChangesParent < Test::Unit::TestCase

  def test_that_changing_class_variables_in_subclasses_change_parent_class_variables
    assert_equal Human.class_variable_get(:@@foodgroup), __
  end
end

