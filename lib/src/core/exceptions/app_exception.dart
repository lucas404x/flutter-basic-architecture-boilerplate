class AppException implements Exception {
  final String message;
  final String? exceptionMessage;

  AppException(this.message, [this.exceptionMessage]);

  @override
  String toString() {
    if (exceptionMessage != null) {
      return '$message: $exceptionMessage';
    }

    return message;
  }
}