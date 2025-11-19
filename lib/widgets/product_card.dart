import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:wonderwall_kicks_mobile/screens/login.dart';
import 'package:wonderwall_kicks_mobile/screens/product_form_page.dart';
import 'package:wonderwall_kicks_mobile/screens/product_entry_list.dart';

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
    final request = context.watch<CookieRequest>();

    return Material(
      color: const Color(0xFF4F74F9),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),

        // UBAH JADI async SESUAI INSTRUKSI
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu menekan tombol ${item.name}!")),
            );

          // ==========================
          //  NAVIGASI TAMBAH PRODUK
          // ==========================
          if (item.name == "Tambah Produk") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProductFormPage()),
            );
          }

          // ================================
          //  NAVIGASI LIHAT PRODUK (LIST)
          // ================================
          else if (item.name == "Lihat Produk") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryListPage(),
              ),
            );
          }

          // ========================
          //  LOGOUT (INSTRUKSI)
          // ========================
          else if (item.name == "Logout") {
            final response = await request.logout(
              "http://localhost:8000/auth/logout/",
            );

            String message = response["message"];

            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$message See you again, $uname."),
                  ),
                );

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              }
            }
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
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
