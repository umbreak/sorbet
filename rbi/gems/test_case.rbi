# typed: __STDLIB_INTERNAL

class ActiveSupport::TestCase < ::Minitest::Test
  sig { params(args: T.untyped, block: T.nilable(T.proc.bind(T.attached_class).void)).void }
  def self.setup(*args, &block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.bind(T.attached_class).void)).void }
  def self.teardown(*args, &block); end

  sig { params(name: T.nilable(String), block: T.proc.bind(T.attached_class).void).void }
  def self.test(name, &block); end
end
