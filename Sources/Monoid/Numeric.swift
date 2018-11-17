extension Semigroup where A: Numeric {
  public static var sum: Semigroup {
    return Semigroup(+)
  }
  public static var product: Semigroup {
    return Semigroup(*)
  }
}

extension Monoid where A: Numeric {
  public static var sum: Monoid {
    return Monoid(empty: 0, semigroup: .sum)
  }
  public static var product: Monoid {
    return Monoid(empty: 1, semigroup: .product)
  }
}