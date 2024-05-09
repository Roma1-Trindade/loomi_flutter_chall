class Maybe<T> {
  final T? value;
  final bool isNothing;

  const Maybe(this.value) : isNothing = false;
  const Maybe.nothing()
      : value = null,
        isNothing = true;
}
