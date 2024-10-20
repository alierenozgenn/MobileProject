import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_1/main.dart';

void main() {
  testWidgets('Sağlık Firmalar Ekranı Testi', (WidgetTester tester) async {
    // Uygulamayı başlat.
    await tester.pumpWidget(const MyApp()); // Burada const ekledik.

    // Sağlık başlığının doğru gösterildiğini kontrol et.
    expect(find.text('Sağlık'), findsOneWidget);

    // Firma arama kutusunun olduğunu kontrol et.
    expect(find.byType(TextField), findsOneWidget);

    // Firma adlarının doğru gösterildiğini kontrol et.
    expect(find.text('Firma Adı Uzun Firma Adı'), findsWidgets);
    expect(find.text('Firma Adı'), findsWidgets);

    // İndirim yüzdelerinin doğru gösterildiğini kontrol et.
    expect(find.text('%10'), findsWidgets);
  });
}
