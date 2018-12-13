extension Semigroup {
  public static func pointwise<A0>(into witness: Semigroup<A>) -> Semigroup<(A0) -> A> {
    return .init { lhs, rhs in
      return { witness.combine(lhs($0), rhs($0)) }
    }
  }
}

extension Monoid {
  public static func pointwise<A0>(into witness: Monoid<A>) -> Monoid<(A0) -> A> {
    return .init(
      empty: { _ in witness.empty },
      semigroup: Semigroup.pointwise(into: witness.semigroup)
    )
  }
}

extension CommutativeMonoid {
  public static func pointwise<A0>(into witness: CommutativeMonoid<A>) -> CommutativeMonoid<(A0) -> A> {
    return .init(
      empty: { _ in witness.empty },
      semigroup: Semigroup.pointwise(into: witness.semigroup)
    )
  }
}

extension IdemptentMonoid {
  public static func pointwise<A0>(into witness: IdemptentMonoid<A>) -> IdemptentMonoid<(A0) -> A> {
    return .init(
      empty: { _ in witness.empty },
      semigroup: Semigroup.pointwise(into: witness.semigroup)
    )
  }
}