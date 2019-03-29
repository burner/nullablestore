module nullablestore;

@safe pure nothrow @nogc:

/** A very stupid type that does nothing more than store a `TypeValue` and a
key. Is is useful to break cycles in type systems.
The value of KeyType.init must equal nullvalue;
*/
struct NullableStore(T,KType = ulong, KType nullvalue = KType.init) {
	///
	alias TypeValue = T;
	alias KeyType = KType;
	static immutable NullValue = nullvalue;

	///
	long key;

	bool isNull() const {
		return this.key == NullValue;
	}
	
	static assert(KeyType.init == NullValue);
}

version(unittest) {
private:
	struct Foo {
		NullableStore!Bar bar;
	}
	
	struct Bar {
		Foo foo;
		NullableStore!Foo nsFoo;
	}
}

unittest {
	Bar b;
	Foo f;
	static assert(NullableStore!(Bar).NullValue == ulong.min);
	assert(f.bar.isNull());

	static if(is(typeof(Foo.bar) : NullableStore!F, F)) {
		assert(is(F == Bar));
		assert(is(Foo.bar.TypeValue == Bar));
	} else {
		assert(false);
	}
}
