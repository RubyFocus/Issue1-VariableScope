
# Variable Scope in Ruby #

- Global
- Constant
- Local
- Instance
- Class
- Special cases - nil and self, true and false (another newsletter)


## Global Variables ##

```ruby

$foobar = "I am a global variable! Call me from ANYWHERE!"
```

Global variables --which should be used with extreme caution-- are available to use anywhere in your code. You can call them, change them at any point because their scope is global. Due to their accessibility, tracking bugs can be especially difficult. Since changes in a global variable change them everywhere, unintended side effects can easily spring up in your code.

``` ruby
class Global
  def method
    $global_var = "global_value"
  end
end

$global_var => "global_value"
```

## Constant ##

``` ruby

DECK = 52

ACES = 4
```

Constant variables, like global variables, can be accessed from anywhere. The defining characteristic of a Constant variable is that it begins with an UPPERCASE variable. The name "constant" is actually a bit misleading because constant variables can be reassigned, although Ruby will throw you a warning if you do so. We call this Syntatic Vinegar, which means Ruby will try you to dissuade you --but not stop you-- from using best practices.

``` ruby

class Constant
CONST =  "constant_value"
end

Constant::CONST => "constant_value"
```

## Local Variables ##

``` ruby

x = "local variable"
```

Local variables are only in scope within the context they were defined in e.g. blocks, methods, classes (which can be considered a block). Once you leave the current context either by entering a new block or exiting the current block, local variables are no longer available.

In the following example, notice how you can only access local variable ‘x’ from within the method:

``` ruby

def local_variable_method_test
  x = "Axe"
  puts x
end
```
The error you would get from trying to access 'x' from outside of the method would like this:

``` ruby

NameError: undefined local variable or method `x' for main:Object
```

## Instance Variables ##

``` ruby

@name = "Pat"
```

Instance variables, which always begin with an "@", belong to the instance of the class they were created in. In Ruby, they are often associated with setting attributes when a class instance is initialized, as in the following example:

``` ruby

class Person
   def initialize(name)
      @name=name
   end

   def display_name
      puts "Person name: #{@name}"
   end
end


pat = Person.new("Pat")
chris = Person.new("Chris")

pat.display_name => "Person name: Pat"

chris.display_name => "Person name: Chris"
```

## Class Variables ##

``` ruby

@@legs = 2
```

Class variables, which always begin with "@@",  are defined within the class and are accessible to all instances of that class as well as any class that inherits from them. In the following example, we define a global variable in the Person class and then create a reader method to call the class variable :

``` ruby

class Person
    @@legs = 2

   def initialize(name)
      @name=name
   end

  def display_name
      puts "Person name: #{@name}"
  end

 def number_of_legs
   @@legs
 end

end

pat = Person.new("Pat")
chris = Person.new("Chris")

pat.number_of_legs => 2

chris.number_of_legs => 2
```
