import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:wonderwall_kicks_mobile/widgets/left_drawer.dart';
import 'package:wonderwall_kicks_mobile/screens/product_entry_list.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _category = "jersey";
  String _thumbnail = "";
  bool _isFeatured = false;

  final List<String> _categories = const [
    'jersey',
    'shoes',
    'ball',
    'accessories',
    'poster'
  ];

  void _resetForm() {
    _formKey.currentState!.reset();
    setState(() {
      _name = "";
      _price = 0;
      _description = "";
      _category = "jersey";
      _thumbnail = "";
      _isFeatured = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Tambah Produk Baru')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama Produk
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nama Produk",
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) => setState(() => _name = v),
                validator: (v) {
                  if (v == null || v.isEmpty) return "Nama tidak boleh kosong!";
                  if (v.length < 3) return "Nama minimal 3 karakter!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Harga
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Harga (Rp)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  setState(() => _price = int.tryParse(v) ?? 0);
                },
                validator: (v) {
                  if (v == null || v.isEmpty) return "Harga tidak boleh kosong!";
                  final val = int.tryParse(v);
                  if (val == null) return "Harga harus berupa angka!";
                  if (val <= 0) return "Harga harus lebih dari 0!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Deskripsi
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Deskripsi Produk",
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                onChanged: (v) => setState(() => _description = v),
                validator: (v) {
                  if (v == null || v.isEmpty) return "Deskripsi tidak boleh kosong!";
                  if (v.length < 10) return "Deskripsi minimal 10 karakter!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Kategori
              DropdownButtonFormField<String>(
                initialValue: _category,
                decoration: const InputDecoration(
                  labelText: "Kategori",
                  border: OutlineInputBorder(),
                ),
                items: _categories
                    .map((cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(cat[0].toUpperCase() + cat.substring(1)),
                        ))
                    .toList(),
                onChanged: (v) => setState(() => _category = v ?? "jersey"),
              ),
              const SizedBox(height: 12),

              // Thumbnail URL
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "URL Thumbnail",
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) => setState(() => _thumbnail = v),
                validator: (v) {
                  if (v == null || v.isEmpty) return "URL thumbnail wajib diisi!";
                  final uri = Uri.tryParse(v);
                  if (uri == null || !uri.hasAbsolutePath) return "URL tidak valid!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Produk unggulan
              SwitchListTile(
                title: const Text("Tandai sebagai produk unggulan"),
                value: _isFeatured,
                onChanged: (v) => setState(() => _isFeatured = v),
              ),

              const SizedBox(height: 20),

              // Tombol Submit
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final thumbnailValue = _thumbnail.isEmpty ? "" : _thumbnail;

                      try {
                        final response = await request.postJson(
                          "http://127.0.0.1:8000/auth/create-product-flutter/",
                          jsonEncode({
                            "name": _name,
                            "price": _price,
                            "description": _description,
                            "category": _category,
                            "thumbnail": thumbnailValue,
                            "is_featured": _isFeatured,
                          }),
                        );

                        if (!context.mounted) return;

                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Produk berhasil disimpan!")),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductEntryListPage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Terjadi kesalahan: ${response['message'] ?? 'Coba lagi'}",
                              ),
                            ),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Gagal koneksi ke server: $e"),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
