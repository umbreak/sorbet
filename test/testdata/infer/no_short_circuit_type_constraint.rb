# typed: true
extend T::Sig

sig do
  type_parameters(:T)
  .params(x: T.nilable(T.type_parameter(:T)))
    # .params(x: T.any(T.type_parameter(:T), NilClass)) # T.type_parameter(:T) | NilClass
  .returns(T.type_parameter(:T))
end
def refute_nil(x)
  raise "unimplemented"
end

# c = T.let(1, T.untyped)
# c = T.let(1, T.nilable(Integer))
c = T.let(1, T.any(Integer, NilClass)) # Integer | NilClass
d = refute_nil(c)
T.reveal_type(d)
