import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';
import 'package:intl/intl.dart';

class ProdukTile extends StatelessWidget {
  final String judul;
  final double harga;
  final String imagePath;
  final VoidCallback? onTap;
  final double width;
  final double heightImage;

  const ProdukTile(
      {super.key,
      required this.judul,
      required this.harga,
      required this.imagePath,
      required this.heightImage,
      required this.width,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    // Mengubah harga menjadi string dengan pemisah ribuan
    final NumberFormat formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    final String hargaFormatted = formatCurrency.format(harga);

    return GestureDetector(
      onTap: onTap,
      child: FillImageCard(
        title: Text(
          judul,
          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
        ),
        description: Text(
          hargaFormatted,
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold, color: Colors.green, fontSize: 18),
        ),
        width: width,
        heightImage: heightImage,
        imageProvider: AssetImage(imagePath),
      ),
    );
  }
}
