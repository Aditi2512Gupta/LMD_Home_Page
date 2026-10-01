import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_page/main.dart';

void main() {
  setUp(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('MyApp renders complete Home Page elements', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Verify header
    expect(find.text('LOGO'), findsOneWidget);

    // Verify search and booking fields
    expect(find.text('Where are you heading?'), findsOneWidget);
    expect(find.text('CHECK-IN'), findsOneWidget);
    expect(find.text('CHECK-OUT'), findsOneWidget);
    expect(find.text('GUESTS'), findsOneWidget);

    // Verify category chips
    expect(find.text('All'), findsOneWidget);
    expect(find.text('Hotels'), findsOneWidget);
    expect(find.text('Resorts'), findsOneWidget);
    expect(find.text('Camping'), findsOneWidget);
    expect(find.text('Villas'), findsOneWidget);
    expect(find.text('Luxury Villas'), findsOneWidget);

    // Verify listings
    expect(find.text('Last Minute Hotels'), findsOneWidget);
    expect(find.text('Hotel Horizon Lonavala'), findsOneWidget);

    // Verify bottom navigation bar
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Bookings'), findsOneWidget);
    expect(find.text('Saved'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });
}
