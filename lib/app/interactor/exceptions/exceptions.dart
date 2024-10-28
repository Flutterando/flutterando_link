abstract class BodyException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  BodyException(this.message, [this.stackTrace]);

  @override
  String toString() {
    final builder = StringBuffer();

    builder.write('$runtimeType: $message');
    if (stackTrace != null) {
      builder.write('\n$stackTrace');
    }

    return builder.toString();
  }
}

class BodyAdapterException extends BodyException {
  BodyAdapterException(super.message, [super.stackTrace]);
}
