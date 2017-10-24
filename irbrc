#!/usr/bin/ruby

require 'irb/completion'
require 'irb/ext/save-history'
require 'awesome_print'

AwesomePrint.irb!

IRB.conf[:SAVE_HISTORY] = 100_000

class Object # :nodoc:
  # Small equality helper
  def all_equals(other)
    ops = %i[== === eql? equal?]
    Hash[ops.map(&:to_s).zip(ops.map { |s| send(s, other) })]
  end

  # List of object' methods which are not in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
end
