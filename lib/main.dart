import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: const Text("Firmalar"),
        ),
        body: const FirmalarScreen(),
      ),
    );
  }
}

class FirmalarScreen extends StatelessWidget {
  const FirmalarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sağlık başlığı
          Row(
            children: const [
              Icon(Icons.health_and_safety, color: Colors.red, size: 40),
              SizedBox(width: 8),
              Text(
                "Sağlık",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Arama kutusu
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Firma Ara',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "İstediğiniz firmada indirim yakalama fırsatı...",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          // Firma kartları listesi
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Sabit örnek için 5 tane kart gösteriliyor
              itemBuilder: (context, index) {
                return FirmaCard(
                  key: ValueKey(index),
                  firmaAdi:
                      index % 2 == 0 ? "Firma Adı Uzun Firma Adı" : "Firma Adı",
                  indirimYuzdesi: "%10",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FirmaCard extends StatelessWidget {
  final String firmaAdi;
  final String indirimYuzdesi;

  const FirmaCard({
    super.key,
    required this.firmaAdi,
    required this.indirimYuzdesi,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.business, color: Colors.grey),
        title: Text(firmaAdi),
        trailing: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(12),
            ),
          ),
          child: Text(
            indirimYuzdesi,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
