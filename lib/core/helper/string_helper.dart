import 'package:fmh_mobile/core/constant/enum.dart';

extension StringHelper on String? {
  String get toTitleCase {
    if (this == null) {
      return '';
    }
    if (this!.isEmpty) {
      return '';
    }
    final words = this!.toLowerCase().split(' ');
    for (var i = 0; i < words.length; i++) {
      words[i] = words[i].substring(0, 1).toUpperCase() + words[i].substring(1);
    }
    return words.join(' ');
  }
}

extension ApplicationTypeString on ApplicationType? {
  String get getString {
    if (this == null) {
      return '';
    }
    return this!.toString().split('.').last;
  }
}

extension EnterpriseTypeString on EnterpriseType? {
  String get getString {
    if (this == null) {
      return '';
    }
    return this!.toString().split('.').last;
  }
}
