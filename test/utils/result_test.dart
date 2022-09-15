import 'dart:io';

import 'package:exagram/feature/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Create a Success Result', () {
    var success = Result.success(5).getOrNull();
    expect(success, equals(5));
  });
  test('Creates a Failure Result', () {
    var failureNull = Result.failure(const HttpException("Error")).getOrNull();
    var failureThrowable =
        Result.failure(const HttpException("Error")).exceptionOrNull();
    expect(failureNull, null);
    expect(failureThrowable.runtimeType, equals(HttpException));
  });
}
