module Konditional
	def if_then(&block)
		self ? block.class == Proc ? block.call : self : self
	end
end

module MethodMissing
	def method_missing(method, *args, &block)
		method == :else ? block.call : super(method, *args)
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
