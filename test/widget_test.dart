import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';

void main() {
  testWidgets('Home page loads correctly and displays welcome message', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MiAplicacion());

    // Verify that the initial page shows the expected welcome text.
    expect(find.text('Pantalla de Inicio\nVe al carrito para ver tus compras.'), findsOneWidget);

    // You can also verify that the AppBar title is correct.
    expect(find.widgetWithText(AppBar, 'Inicio'), findsOneWidget);
  });
}
