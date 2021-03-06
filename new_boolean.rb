module Konditional
  def if_then(&block)
    self ? block_given? ? block.call : self : self
  end
end

module MethodMissing
  def method_missing(method, *args, &block)
    method == :else  ? self : super(method, *args)
  end
end

class TrueClass
  include Konditional
end

class FalseClass
  include Konditional

  def else
    yield
  end
end

class Object
  include MethodMissing
end
