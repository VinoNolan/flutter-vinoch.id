import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinoch_id/components/carttile.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 237, 237, 1),
      // APPBAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(100, 153, 233, 1),
        title: Text(
          'Keranjang',
          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20), child: CartTile()),
      ),
    );
  }
}
