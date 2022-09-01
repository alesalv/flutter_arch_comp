// TODO(alesalv): add docs
class Result<T> {
  /// Use static methods to initialize this class
  Result(this.status, {this.data, this.msg = ''});

  final _ResultStatus status;
  final T? data;
  final String msg;

  static Result<T> success<T>(T data) =>
      Result(_ResultStatus.success, data: data);

  static Result<T> error<T>(String msg) =>
      Result(_ResultStatus.error, msg: msg);

  bool get isSuccess => status == _ResultStatus.success;
  bool get isError => status == _ResultStatus.error;
}

// ResultStatus represents one of [success, error]
enum _ResultStatus {
  success,
  error,
}
