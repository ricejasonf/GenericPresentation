# Generic Programming
> A Disguised Attempt to Convince my Coworkers to use C++

## Fundamental Theorem of Software Engineering (FTSE)

"We can solve any problem by introducing an extra level of indirection."

## What is it?

Generic programming is a style of computer programming in which algorithms
are written in terms of types to-be-specified-later that are then
instantiated when needed for specific types provided as parameters.
~ Wikipedia

Really it's about taking concrete algorithms and data structures and
generalizing them to work with other types.

These types can be anything, or they can be required to fit certain
constraints via **Concepts**.

## Concepts

> Not a part of C++ yet

```cpp
template <typename T>
concept bool EqualityComparable() { 
    return requires(T a, T b) {
        {a == b} -> Boolean; // Boolean is the concept defining a type usable in boolean context
        {a != b} -> Boolean;
    };
}
```

For a type of satisfy a concept it can be required to implelement a set of
generic functions, but there is more to this.

## Axioms

```cpp
concept EqualityComparable<typename T> 
{
  bool operator==(const T& x, const T& y);
  bool operator!=(const T& x, const T& y) { return !(x == y); }
 
  axiom Consistency(T x, T y) {
    (x == y) <=> !(x != y);
  }
 
  axiom Identity(T& x, T& y) {
    &x == &y => x == y;
  }
 
  axiom Reflexivity(T x) { 
    x == x; 
  }
 
  axiom Symmetry(T x, T y) {
    x == y => y == x;
  }
 
  axiom Transitivity(T x, T y, T z) {
    (x == y && y == z) => x == z;
  }
}
```

Axioms can be used to create a set of mathematical laws a type
must satsify for a given concept.

Eventhough a language might not support this, it can be still
be achieved through unit testing.

## Polymorphism

### Parametric Polymorphism

Generic implementations of functions or data types that
handle values uniformly

This relies on the types having uniform interfaces.

```cpp
template <typename Xs>
auto sum(Xs const& xs)
{ 
  using value_type = typename Xs::value_type;
  value_type s;
  for (auto x : xs)
  { 
    s += x;
  }
} 
```

### Ad Hoc Polymorphism

Generic functions or data types that behave differently
for different types.

This can be achieved via function overloading or template
specialization in C++

```cpp
void bind(Json::Value const& obj, int& field)
{
  if (!obj.isIntegral())
    throw std::runtime_error("JSON Integral expected");
  field = obj.asInt();
}
```

### Subtyping Polymorphism

```
struct Cat :: Animal
{
  auto speak() override
  { 
    return "Meow!";
  }
} 
```
