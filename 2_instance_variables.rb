require 'test/unit'
require_relative 'ruby_focus_helper'

# Instance variables, which always begin with an “@”, belong to
# the instance of the class they were created in. In Ruby, they
# are often associated with setting attributes when a class instance
# is initialized.


class Person
  @@full_name = "Class Name"

  attr_accessor :address

  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

end


class PersonTest < Test::Unit::TestCase

  def test_that_instance_variables_are_unique_by_instance
    person1 = Person.new
    person1.first_name = "Bob"
    assert_equal __, person1.instance_variable_get(:@first_name)

    person2 = Person.new
    person2.first_name = "Joe"
    assert_equal __, person2.instance_variable_get(:@first_name)
  end

  def test_that_methods_can_access_instance_variables
    person = Person.new
    person.first_name = "Bob"
    person.last_name = "Sanders"

    assert_equal __, person.full_name
  end

  def test_that_attribute_accessors_create_instance_variables
    person = Person.new
    person.address = "1 Ruby Way"

    assert_equal __, person.address

  end
end
