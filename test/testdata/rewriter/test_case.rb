# typed: strict

class MyTest < ActiveSupport::TestCase
  extend T::Sig
  # Helper instance method
  sig { params(test: T.untyped).returns(T::Boolean) }
  def assert(test)
    test ? true : false
  end

  setup do
    @a = T.let(1, Integer)
    foo # error: Method `foo` does not exist on `MyTest`
  end

  setup do
    bar # error: Method `bar` does not exist on `MyTest`
  end

  test "valid method call" do
  end

  test "block is evaluated in the context of an instance" do
    assert true
  end

  teardown do
    fiz # error: Method `fiz` does not exist on `MyTest`
  end

  teardown do
    baz # error: Method `baz` does not exist on `MyTest`
  end
end

class NoMatchTest < ActiveSupport::TestCase
  setup do
    @a = T.let(123, Integer)
  # ^^ error: The instance variable `@a` must be declared inside `initialize` or declared nilable
  end
end
