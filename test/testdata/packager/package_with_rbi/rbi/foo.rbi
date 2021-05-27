# typed: strict

class RBI::Foo
  extend T::Sig

  sig {returns(::Integer)}
  def self.one(); end
end

class ::GlobalBar
  extend T::Sig

  sig {returns(RBI::Foo)}
  def self.foo(); end
end
