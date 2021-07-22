# typed: strict
# disable-fast-path: true

class Foo; end
class Bar < Foo; end
class Baz < Foo; end

module M
  extend T::Generic

  Args = type_member(upper: Foo, lower: Bar)
end

class A
  extend T::Generic

  include M

  Args = type_member(fixed: NilClass)
       # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ error: parent lower bound `Bar` is not a subtype of lower bound `NilClass`
       # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ error: upper bound `NilClass` is not a subtype of parent upper bound `Foo`
end

class B
  extend T::Generic

  include M

  Args = type_member(upper:Foo, lower: Baz)
       # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ error: parent lower bound `Bar` is not a subtype of lower bound `Baz`
end
