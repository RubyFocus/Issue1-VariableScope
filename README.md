## Instructions ##

#### Setup ####

To be able to complete the exercises, you must have Ruby installed on your computer. If you do not have Ruby setup, please visit http://ruby-lang.org/en/downloads/ for instructions on installation.

Also, you should have Git installed on your computer and a Github account. If you need some help, please visit http://try.github.com and https://help.github.com/ for instructions on getting setup.

While just about any text editor will do, I suggest trying [Sublime Text 2](www.sublimetext.com), [TextMate](www.macromates.com), or [Emacs](www.gnu.org/s/emacs).


#### To Complete the Exercises ####

Clone this repository.

`git clone https://github.com/RubyFocus/Issue1-VariableScope.git`

Open the file in your text editor and replace the "__" in the tests with your answers and when you are done run the exercise files to get your results.

For example, to run glob_var.rb, use the 'ruby glob_var.rb' command from the command line prompt of the appropriate folder.

#### References and Followups ####

Here is a list of some other great resources that might help you.

[ruby.runpaint.com](http://ruby.runpaint.org/variables)

[railstips- class and instance variables](http://railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/)

[techtopia](http://www.techotopia.com/index.php/Ruby_Variable_Scope)

[video by tekniqal](http://www.tekniqal.com/2009/3/Variable-Scope-in-Ruby)

Also, I would like to give many thanks to Jim Weirich and Joe O'Brien, the creators of Ruby Koans, for helping me on my journey to become a better Rubyist. [Ruby Koans](http://http://rubykoans.com/)

# Variables #

Variables are used to temporarily store data that can be reused and manipulated. Think of them like a box. A box with a label on it that you created so that you can reference that piece of data easily. Variables are assigned using the '=' symbol. There are many types available for use, but there are some general good practices to assigning variables that I want to cover. 

#### The Do’s ####

1. Make your variable names meaningful. The names of your variables should be descriptive of the data assigned to it. Not only will it be easier for you to understand what that variable points to, but it will be easier for your co-workers to understand what that variable points to, also.

2. Do use the #local_variables method. Variables are subject to scope, whether you like it or not. This is a great way to find out what variables are in the scope of the part of the program you are working in. Knowing is half the battle.


#### The Don’ts #####

1. Do not begin a variable with a number. Not only should you not do this, but you CAN’T do this. This is so the interpreter can distinguish between a variable and an integer. Don’t confuse the interpreter. The interpreter is your friend. Although, you can’t begin a variable with a number, Ruby does accept an underscore as the beginning of a variable.

2. Do not begin a variable with an uppercase letter. Ruby is case-sensitive. Variables must begin with a lowercase letter. To do otherwise would be to create a Constant. Constants are just that, constant. They aren’t supposed to be changed throughout the duration of the program (although, they can be. We will get into this shortyly). Avoiding uppercase letters in your variables will help you avoid unwanted headaches.

3. Don’t use single letter variables. I somewhat covered this already in #1 of the “Do’s”, but I think this is so important it should be said twice. Variable names should be meaningful. Assigning the letter “a” to a gets#chomp method on a string requesting user input is just mean. Don’t be mean.

If you follow this short list of Do’s and Don’ts, you will be rocking Ruby variables like a superstar. Stay strong. Stay focused. Don’t use single letter variables.


# Variable Scope in Ruby #

- [Global](#global-variables)
- [Constant](#constant)
- [Local](#local-variables)
- [Instance](#instance-variables)
- [Class](#class-variables)

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
