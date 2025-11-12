import 'package:flutter/material.dart';
import 'package:wonderwall_kicks_mobile/widgets/left_drawer.dart';

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
    'jersey', 'shoes', 'ball', 'accessories', 'poster'
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
              // NAME
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

              // PRICE
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Harga (Rp)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  setState(() {
                    _price = int.tryParse(v) ?? 0;
                  });
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

              // DESCRIPTION
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

              // CATEGORY
              DropdownButtonFormField<String>(
                value: _category,
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
                onChanged: (v) => setState(() => _category = v!),
              ),
              const SizedBox(height: 12),

              // THUMBNAIL URL
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "URL Thumbnail",
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) => setState(() => _thumbnail = v),
                validator: (v) {
                  if (v == null || v.isEmpty) return "URL thumbnail wajib diisi!";
                  final regex = Uri.tryParse(v);
                  if (regex == null || !regex.hasAbsolutePath) return "URL tidak valid!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // FEATURED
              SwitchListTile(
                title: const Text("Tandai sebagai produk unggulan"),
                value: _isFeatured,
                onChanged: (v) => setState(() => _isFeatured = v),
              ),

              // SUBMIT
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Produk berhasil disimpan!'),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nama: $_name'),
                                Text('Harga: Rp $_price'),
                                Text('Deskripsi: $_description'),
                                Text('Kategori: $_category'),
                                Text('Thumbnail: $_thumbnail'),
                                Text('Unggulan: ${_isFeatured ? "Ya" : "Tidak"}'),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _resetForm();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text("Save", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
