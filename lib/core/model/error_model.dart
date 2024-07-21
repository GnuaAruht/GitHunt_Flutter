class Error {

  final int? code;
  final String message;

  bool get isUnAuthorized => code != null && code == 401;

  Error({this.code, required this.message});

  factory Error.unknown() => Error(message: "Something went wrong.");
  factory Error.connectionError() => Error(message: "Failed to connect.");
  factory Error.connectionTimeOut() => Error(message: "Connection timeout.");
  factory Error.sendTimeOut() => Error(message: "Send timeout.");
  factory Error.receiveTimeOut() => Error(message: "Receive timeout.");
  factory Error.badCertificate() => Error(message: "Bad certificate.");
  factory Error.cancelled() => Error(message: "Request is cancelled.");

}
