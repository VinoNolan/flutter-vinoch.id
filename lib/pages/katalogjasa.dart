import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vinoch_id/components/produktile.dart';
import 'package:vinoch_id/models/produklist.dart';
import 'package:vinoch_id/pages/detailpage.dart';
import 'package:vinoch_id/pages/keranjangpage.dart';

class KatalogJasa extends StatefulWidget {
  const KatalogJasa({super.key});

  @override
  State<KatalogJasa> createState() => _KatalogJasaState();
}

class _KatalogJasaState extends State<KatalogJasa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(238, 237, 237, 1),
//APPBAR
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(100, 153, 233, 1),
          title: Text(
            'Katalog Jasa',
            style: GoogleFonts.lato(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const KeranjangPage(),
                          type: PageTransitionType.fade));
                },
                icon: const Icon(
                  Icons.shopping_cart_rounded,
                  size: 30,
                ))
          ],
        ),
//GRIDVIEW
        body: GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .8,
          ),
          itemCount: produkkatalog.length - 4, // Menggunakan indeks 4 hingga 7
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ProdukTile(
                judul: produkkatalog[index + 4].judul,
                harga: produkkatalog[index + 4].harga,
                imagePath: produkkatalog[index + 4].imagePath,
                heightImage: 100,
                width: 165,
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: DetailProduk(produk: produkkatalog[index + 4]),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
              ),
            );
          },
        ));
  }
}
