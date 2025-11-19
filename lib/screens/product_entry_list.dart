import 'package:flutter/material.dart';
import 'package:wonderwall_kicks_mobile/models/product_entry.dart';
import 'package:wonderwall_kicks_mobile/widgets/product_entry_card.dart';
import 'package:wonderwall_kicks_mobile/widgets/left_drawer.dart';
import 'package:wonderwall_kicks_mobile/screens/product_detail.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProducts() async {
    try {
      final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/auth/json/'),   // ← FIXED
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data
            .map((jsonEntry) => ProductEntry.fromJson(jsonEntry))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder<List<ProductEntry>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Terjadi kesalahan: ${snapshot.error}',
                style: const TextStyle(fontSize: 16),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada produk yang tersedia.',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          final products = snapshot.data!;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, index) => ProductEntryCard(
              product: products[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailPage(product: products[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
