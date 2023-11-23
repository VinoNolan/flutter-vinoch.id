import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vinoch_id/components/detailprodukscreen.dart';

import 'package:vinoch_id/models/produklist.dart';
import 'package:vinoch_id/pages/keranjangpage.dart';
import 'package:vinoch_id/pages/tatatransaksipage.dart';

import '../models/cartprovider.dart';

class DetailProduk extends StatefulWidget {
  final Produk produk;

  const DetailProduk({
    super.key,
    required this.produk,
  });

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
// LOGIKA UNTUK FUNGSI CART
  void tambahKeranjang() {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    const quantity = 1;
    cartProvider.addItemToCart(widget.produk, quantity);

// Tampilkan SnackBar untuk memberi tahu bahwa produk berhasil ditambahkan ke keranjang
    const snackBar = SnackBar(
      content: Text('Produk berhasil ditambahkan ke keranjang'),
      duration: Duration(seconds: 2), // Durasi tampilan SnackBar
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

//FLOATING BUTTON BUTTON 1
  Widget tatacara() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            PageTransition(
                child: const TatacaraPage(), type: PageTransitionType.fade));
      },
      heroTag: "btn1",
      tooltip: 'First button',
      child: const Icon(Icons.announcement_rounded),
    );
  }

//FLOATING BUTTON BUTTON 2
  Widget hubungiadmin() {
    return FloatingActionButton(
      onPressed: () {
        launchUrl(Uri.parse('https://wa.me/6281586557363'));
      },
      heroTag: "btn2",
      tooltip: 'Second button',
      child: const Icon(Icons.admin_panel_settings),
    );
  }

// FLOATING BUTTON BUTTON 3
  Widget cart() {
    return FloatingActionButton(
      onPressed: () {
        tambahKeranjang();
      },
      heroTag: "btn3",
      tooltip: 'Third button',
      child: const Icon(Icons.add_shopping_cart_rounded),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// FLOATING BUTTON
      floatingActionButton: AnimatedFloatingActionButton(
          fabButtons: [tatacara(), hubungiadmin(), cart()],
          animatedIconData: AnimatedIcons.menu_close),
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const KeranjangPage(),
                        type: PageTransitionType.fade));
              },
              icon: const Icon(Icons.shopping_cart_rounded))
        ],
        elevation: 0,
        backgroundColor: const Color.fromRGBO(100, 153, 233, 1),
        centerTitle: true,
        title: Text(
          'Halaman Detail',
          style: GoogleFonts.lato(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          child: DetailProdukScreen(
              deskripsi: widget.produk.deskripsi,
              imagePath: widget.produk.imagePath,
              judul: widget.produk.judul,
              harga: widget.produk.harga)),
    );
  }
}
