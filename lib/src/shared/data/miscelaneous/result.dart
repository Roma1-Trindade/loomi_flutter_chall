class Result<T> {
  final bool success;
  final T? value;
  final String? errorMessage;

  Result({
    required this.success,
    this.value,
    this.errorMessage,
  });
}
