import 'package:fmh_mobile/core/model/error_model.dart';

class FailureException {
  final ErrorModel error;
  FailureException(this.error);
  @override
  String toString() {
    String e = 'An error occured';
    if (error.message != null) {
      e = error.message ?? '';
    }
    return e;
  }
}
