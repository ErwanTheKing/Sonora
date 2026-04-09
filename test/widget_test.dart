import 'package:flutter_test/flutter_test.dart';
import 'package:sonora/main.dart';

void main() {
  testWidgets('Sonora app loads correctly', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const SonoraApp());

    // Verify welcome text exists
    expect(find.text('Welcome to Sonora 🎧'), findsOneWidget);
  });
}