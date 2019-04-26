module nullablestore;

@safe pure nothrow @nogc:

/** A very stupid type that does nothing more than store a `TypeValue` and a
key. Is is useful to break cycles in type systems.
The value of KeyType.init must equal nullvalue;
*/
struct NullableStore(T) {
	///
	alias TypeValue = T;
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
}
