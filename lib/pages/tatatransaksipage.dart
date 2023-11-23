import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TatacaraPage extends StatelessWidget {
  const TatacaraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 237, 237, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(100, 153, 233, 1),
        centerTitle: true,
        title: Text(
          'Tata Cara Transaksi',
          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
        ),
      ),
// ICON LAMPU
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Icon(
                Icons.tips_and_updates_rounded,
                size: 150,
                color: Color.fromRGBO(233, 184, 36, 1),
              ),
              const SizedBox(
                height: 20,
              ),
// CONTAINER TEMPAT ISI
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 16, bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Pilih katalog Produk/Jasa',
                      style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '2. Setelah itu akan masuk ke halaman detail Produk/Jasa',
                      style: GoogleFonts.lato(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '3. Tambahkan ke keranjang dahulu',
                      style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '4. Pada halaman keranjang, silahkan pilih checkout',
                      style: GoogleFonts.lato(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '5. Pada halaman checkout silahkan isi data',
                      style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '6. Pada pembayaran silahkan transfer bank, kirimkan bukti melalui "Hubungi Admin"',
                      style: GoogleFonts.lato(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '7. Admin akan segera proses pemesanan',
                      style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '8. Untuk pemesanan license akan dikirimkan kode license melalui email',
                      style: GoogleFonts.lato(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '9. Untuk pemesanan Jasa akan segera dihubungi oleh Admin',
                      style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
