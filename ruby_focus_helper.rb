class Replace___WithCorrectErrorType < StandardError
end

def ruby_version?(version)
  RUBY_VERSION =~ /^#{version}/ ||
    (version == 'jruby' && defined?(JRUBY_VERSION)) ||
    (version == 'mri' && ! defined?(JRUBY_VERSION))
end

def in_ruby_version(*versions)
  yield if versions.any? { |v| ruby_version?(v) }
end

in_ruby_version("1.8") do
  class KeyError < StandardError
  end
end

# Standard, generic replacement value.
# If value19 is given, it is used in place of value for Ruby 1.9.
def __(value="Replace __ With Correct Value", value19=:mu)
  if RUBY_VERSION < "1.9"
    value
  else
    (value19 == :mu) ? value : value19
  end
end

# Numeric replacement value.
def _n_(value=999999, value19=:mu)
  if RUBY_VERSION < "1.9"
    value
  else
    (value19 == :mu) ? value : value19
  end
end

# Error object replacement value.
def ___(value=Replace___WithCorrectErrorType, value19=:mu)
  if RUBY_VERSION < "1.9"
    value
  else
    (value19 == :mu) ? value : value19
  end
end

# Method name replacement.
class Object
  def ____(method=nil)
    if method
      self.send(method)
    end
  end

  in_ruby_version("1.9") do
    public :method_missing
  end
end
