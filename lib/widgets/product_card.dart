import 'package:flutter/material.dart';
import 'package:wonderwall_kicks_mobile/screens/product_form_page.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  const ItemHomepage(this.name, this.icon);
}

class ProductCard extends StatelessWidget {
  final ItemHomepage item;
  const ProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF4F74F9),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu menekan tombol ${item.name}!")),
            );

          if (item.name == "Tambah Produk") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProductFormPage()),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(24),
          constraints: const BoxConstraints(minHeight: 140),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 56, color: Colors.white),
              const SizedBox(height: 16),
              Text(
                item.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
