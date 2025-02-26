import 'package:flutter_test/flutter_test.dart';
import 'package:test_test/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('UserServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
