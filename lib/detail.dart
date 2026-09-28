import 'package:flutter/material.dart';
import 'colors.dart';
import 'models/data.dart';

class DetailPage extends StatelessWidget {
  final Menu menu;
  const DetailPage({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(menu.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'menu-${menu.id}',
              child: Image.network(
                menu.image,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menu.name,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(menu.category, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  Text(
                    menu.price,
                    style: const TextStyle(
                      fontSize: 18,
                      color: kNavy,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontWeight: FontWeight.bold, color: kNavy),
                  ),
                  const SizedBox(height: 4),
                  Text(menu.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
