# NullableStore
A Nullable without the payload but instead with a key.

This
```D
struct Foo {
	Nullable!Bar bar;
}

struct Bar {
	Nullable!Foo foo;
}
```
is not possible because Nullable might actual store a Bar and this will create
a forward reference;

This
```D
import nullablestore;
struct Foo {
	NullableStore!Bar bar;
}

struct Bar {
	NullableStore!Foo foo;
}
```
on the other hand will work, but the actual value of foo and bar need to be
retrived by looking at the key member inside NullableStore.

## Contributing
PRs are welcome!

# About Kaleidic Associates
We are a boutique consultancy that advises a small number of hedge fund clients.  We are
not accepting new clients currently, but if you are interested in working either remotely
or locally in London or Hong Kong, and if you are a talented hacker with a moral compass
who aspires to excellence then feel free to drop me a line: laeeth at kaleidic.io

We work with our partner Symmetry Investments, and some background on the firm can be
found here:

http://symmetryinvestments.com/about-us/
