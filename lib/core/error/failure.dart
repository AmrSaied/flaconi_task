abstract class Failure {
  String? get message;
  const Failure();
}

class ApiFailure extends Failure {
  @override
  final String? message;
  const ApiFailure({this.message});
}

class GeneralFailure extends Failure {
  @override
  final String? message;
  const GeneralFailure({this.message});
}
