abstract class FailureMovie implements Exception {}

class InvalidIdError implements FailureMovie {
  final String status;

  InvalidIdError(this.status);

  @override
  String toString() {
    return 'Failure Movie => Invalid ID Erro $status';
  }
}

class NotFoundIdError implements FailureMovie {
  final String status;

  NotFoundIdError(this.status);

  @override
  String toString() {
    return 'Failure Movie => Not Found ID $status';
  }
}
