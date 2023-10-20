import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:integration_test/integration_test.dart';

import 'main_screen/main_test_cases.dart';
import 'mocked_classes/mocked.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    GeolocatorPlatform.instance = MockGeoLocatorPlatform();
  });
  final mainTest = MainTestcases();
  mainTest.testAllCases();
}